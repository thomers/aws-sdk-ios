//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSUserPoolForgotPasswordViewController.h"
#import <AWSUserPoolsSignIn/AWSUserPoolsSignIn.h>
#import "AWSFormTableCell.h"
#import "AWSFormTableDelegate.h"
#import "AWSAuthUIHelper.h"
#import <AWSAuthCore/AWSUIConfiguration.h>
#import <AWSUserPoolsSignIn/AWSUserPoolsUIOperations.h>

@interface AWSUserPoolForgotPasswordViewController ()

@property (nonatomic, strong) AWSCognitoIdentityUserPool *pool;
@property (nonatomic, strong) AWSCognitoIdentityUser *user;
@property (nonatomic, strong) AWSFormTableCell *userNameRow;
@property (nonatomic, strong) AWSFormTableDelegate *tableDelegate;

@end

@interface AWSUserPoolNewPasswordViewController ()

@property (nonatomic, strong) AWSCognitoIdentityUser *user;
@property (nonatomic, strong) AWSFormTableCell *updatedPasswordRow;
@property (nonatomic, strong) AWSFormTableCell *confirmationCodeRow;
@property (nonatomic, strong) AWSFormTableDelegate *tableDelegate;

@end

@implementation AWSUserPoolForgotPasswordViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    self.pool = [AWSCognitoIdentityUserPool defaultCognitoIdentityUserPool];
}

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_VIEW_FORGOTPASSWORD object:self];
}

// This is used to dismiss the keyboard, user just has to tap outside the
// user name and password views and it will dismiss
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.phase == UITouchPhaseBegan) {
        [self.view endEditing:YES];
    }
    
    [super touchesBegan:touches withEvent:event];
}

- (void)setUp {
    _userNameRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Email" type:InputTypeText];
    _tableDelegate = [AWSFormTableDelegate new];
    [self.tableDelegate addCell:self.userNameRow];
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    [self.tableView reloadData];
    [AWSAuthUIHelper setUpFormShadowForView:self.tableFormView];
    [self setUpBackground];
    
    // setup button background
    [AWSAuthUIHelper applyPrimaryColorFromConfig:self.config
                                          toView:self.forgotPasswordButton];
}

- (void)setUpBackground {
    if ([AWSAuthUIHelper isBackgroundColorFullScreen:self.config]) {
        self.view.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    } else {
        self.view.backgroundColor = [AWSAuthUIHelper getSecondaryBackgroundColor];
    }
    
    self.title = @"Forgot Password";
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
    backgroundImageView.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if([@"NewPasswordSegue" isEqualToString:segue.identifier]){
        AWSUserPoolNewPasswordViewController * confirmForgot = segue.destinationViewController;
        confirmForgot.config = self.config;
        confirmForgot.user = self.user;
    }
}

- (IBAction)onForgotPassword:(id)sender {
    NSString *userName = [self.tableDelegate getValueForCell:self.userNameRow forTableView:self.tableView];
    if ([userName isEqualToString:@""] || ![AWSAuthUIHelper isValidEmail:userName]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Invalid Email"
                                                                                 message:@"Please enter a valid email."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        return;
    }
    self.user = [self.pool getUser:userName];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_FORGOTPASSWORD_EMAIL_INPROGRESS_NOTIFICATION object:self];

    [[self.user forgotPassword] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserForgotPasswordResponse *> * _Nonnull task) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(task.error){
				[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_FORGOTPASSWORD_EMAIL_ERROR_NOTIFICATION object:self userInfo:@{@"error" : task.error}];

                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:task.error.userInfo[@"__type"]
                                                                                         message:task.error.userInfo[@"message"]
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }else {
				[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_FORGOTPASSWORD_EMAIL_SUCCESS_NOTIFICATION object:self];

                [self performSegueWithIdentifier:@"NewPasswordSegue" sender:sender];
            }
        });
        return nil;
    }];
}

@end

@implementation AWSUserPoolNewPasswordViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConfirmCodeReceived:) name:NFAWS_CONFIRMCODE_RECEIVED_NOTIFICATION object:nil];
}

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_VIEW_NEWPASSWORD object:self];
}


- (void) onConfirmCodeReceived:(NSNotification *) notification {
	NSString *code = notification.userInfo[@"code"];
	self.confirmCodeReceived = code;
	[self onUpdatePassword:nil];

}

// This is used to dismiss the keyboard, user just has to tap outside the
// user name and password views and it will dismiss
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.phase == UITouchPhaseBegan) {
        [self.view endEditing:YES];
    }
    
    [super touchesBegan:touches withEvent:event];
}

- (void)setUp {
    _confirmationCodeRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Confirmation Code" type:InputTypeText];
    _updatedPasswordRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"New Password" type:InputTypePassword];
    _tableDelegate = [AWSFormTableDelegate new];
    [self.tableDelegate addCell:self.confirmationCodeRow];
    [self.tableDelegate addCell:self.updatedPasswordRow];
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    [self.tableView reloadData];
    [AWSAuthUIHelper setUpFormShadowForView:self.tableFormView];
    [self setUpBackground];
    
    // setup button background
    [AWSAuthUIHelper applyPrimaryColorFromConfig:self.config
                                          toView:self.updatePasswordButton];
}

- (void)setUpBackground {
    if ([AWSAuthUIHelper isBackgroundColorFullScreen:self.config]) {
        self.view.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    } else {
        self.view.backgroundColor = [AWSAuthUIHelper getSecondaryBackgroundColor];
    }
    
    self.title = @"Forgot Password";
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
    backgroundImageView.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (IBAction)onUpdatePassword:(id)sender {
    //confirm forgot password with input from ui.
	
	NSString *confirmationCode;
	if (self.confirmCodeReceived) {
		confirmationCode = self.confirmCodeReceived;
	} else {
		confirmationCode = [self.tableDelegate getValueForCell:self.confirmationCodeRow forTableView:self.tableView];
	}
	
    NSString *updatedPassword = [self.tableDelegate getValueForCell:self.updatedPasswordRow forTableView:self.tableView];
    if ([confirmationCode isEqualToString:@""] || [updatedPassword isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing Information"
                                                                                 message:@"Please enter valid confirmation code and password values."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        return;
    }
	
	[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_FORGOTPASSWORD_UPDATEPASSWORD_INPROGRESS_NOTIFICATION object:self];

	
    [[self.user confirmForgotPassword:confirmationCode password:updatedPassword] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserConfirmForgotPasswordResponse *> * _Nonnull task) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(task.error){
				[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_FORGOTPASSWORD_UPDATEPASSWORD_ERROR_NOTIFICATION object:self userInfo:@{@"error" : task.error}];

                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:task.error.userInfo[@"__type"]
                                                                                         message:task.error.userInfo[@"message"]
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
                
            }else {
				[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_FORGOTPASSWORD_UPDATEPASSWORD_SUCCESS_NOTIFICATION object:self];

                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Password Reset Complete"
                                                                                         message:@"Password Reset was completed successfully."
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self.navigationController popToRootViewControllerAnimated:YES];
                }];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }
        });
        return nil;
    }];
}

@end

