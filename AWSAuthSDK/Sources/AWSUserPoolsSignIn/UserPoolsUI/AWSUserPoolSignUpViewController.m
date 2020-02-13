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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AWSUserPoolSignUpViewController.h"
#import <AWSUserPoolsSignIn/AWSUserPoolsSignIn.h>
#import "AWSFormTableCell.h"
#import "AWSTableInputCell.h"
#import "AWSFormTableDelegate.h"
#import "AWSAuthUIHelper.h"
#import <AWSAuthCore/AWSSignInManager.h>
#import <AWSAuthCore/AWSUIConfiguration.h>
#import <AWSUserPoolsSignIn/AWSUserPoolsUIOperations.h>

@interface AWSSignInManager()
    
@property (nonatomic) BOOL pendingSignIn;
@property (strong, atomic) NSString *pendingUsername;
@property (strong, atomic) NSString *pendingPassword;
    
-(void)reSignInWithUsername:(NSString *)username
               password:(NSString *)password;
@end

@interface AWSUserPoolSignUpViewController()

@property (nonatomic, strong) AWSCognitoIdentityUserPool * pool;
@property (nonatomic, strong) NSString* sentTo;
@property (nonatomic, strong) AWSFormTableCell *userNameRow;
@property (nonatomic, strong) AWSFormTableCell *passwordRow;
@property (nonatomic, strong) AWSFormTableCell *phoneNumberRow;
@property (nonatomic, strong) AWSFormTableCell *emailRow;
@property (nonatomic, strong) AWSFormTableDelegate *tableDelegate;

@end

@interface UserPoolSignUpConfirmationViewController()

@property (nonatomic, strong) NSString* sentTo;
@property (nonatomic, strong) AWSCognitoIdentityUser * user;
@property (nonatomic, strong) AWSFormTableCell *userNameRow;
@property (nonatomic, strong) AWSFormTableCell *confirmationCodeRow;
@property (nonatomic, strong) AWSFormTableDelegate *tableDelegate;

@end

@implementation AWSUserPoolSignUpViewController

id<AWSUIConfiguration> config = nil;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pool = [AWSCognitoIdentityUserPool defaultCognitoIdentityUserPool];
    [self setUp];
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
    _userNameRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Email" type:InputTypeEmail];
    _passwordRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Password (min. 8 characters)" type:InputTypePassword];
  //  _emailRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Email" type:InputTypeText];
  //  _phoneNumberRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Phone Number" type:InputTypeText];
    _tableDelegate = [AWSFormTableDelegate new];
    [self.tableDelegate addCell:self.userNameRow];
    [self.tableDelegate addCell:self.passwordRow];
    //[self.tableDelegate addCell:self.emailRow];//        NOTE - just commenting does not reduze the table view HEIGHT, and it still shows 4 rows (2 empty)
    //[self.tableDelegate addCell:self.phoneNumberRow]; // Edit the tableview height constraint in AWSUserPoolsSignin/Resources/AWSUserPools.storyboard!
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    [self.tableView reloadData];
    [AWSAuthUIHelper setUpFormShadowForView:self.tableFormView];
    [self setUpBackground];

    // setup button background
    [AWSAuthUIHelper applyPrimaryColorFromConfig:self.config
                                          toView:self.signUpButton];
}

- (void)setUpBackground {
    if ([AWSAuthUIHelper isBackgroundColorFullScreen:self.config]) {
        self.view.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    } else {
        self.view.backgroundColor = [AWSAuthUIHelper getSecondaryBackgroundColor];
    }
    
    self.title = @"Sign Up";
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
    backgroundImageView.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([@"SignUpConfirmSegue" isEqualToString:segue.identifier]){
        UserPoolSignUpConfirmationViewController *signUpConfirmationViewController = segue.destinationViewController;
        signUpConfirmationViewController.sentTo = self.sentTo;
        signUpConfirmationViewController.config = self.config;
        NSString *userName = [self.tableDelegate getValueForCell:self.userNameRow forTableView:self.tableView];
        signUpConfirmationViewController.user = [self.pool getUser:userName];
    }
}


- (IBAction)onSignUpClicked:(id)sender {
    
    NSMutableArray * attributes = [NSMutableArray new];
    AWSCognitoIdentityUserAttributeType * phone = [AWSCognitoIdentityUserAttributeType new];
    phone.name = @"phone_number";
    phone.value = [self.tableDelegate getValueForCell:self.phoneNumberRow forTableView:self.tableView];
    AWSCognitoIdentityUserAttributeType * email = [AWSCognitoIdentityUserAttributeType new];
    email.name = @"email";
    email.value = [self.tableDelegate getValueForCell:self.userNameRow forTableView:self.tableView];
    
    if(phone.value && ![@"" isEqualToString:phone.value]){
        [attributes addObject:phone];
    }
    if(email.value && ![@"" isEqualToString:email.value]){
        [attributes addObject:email];
    }
    
    NSString *userName = [self.tableDelegate getValueForCell:self.userNameRow forTableView:self.tableView];
    NSString *password = [self.tableDelegate getValueForCell:self.passwordRow forTableView:self.tableView];
	if ([userName isEqualToString:@""] || [password isEqualToString:@""] || ![AWSAuthUIHelper isValidEmail:userName]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing Information"
                                                                                 message:@"Please enter a valid Email and password."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        return;
    }
    
    NSString *phoneNumber = [self.tableDelegate getValueForCell:self.phoneNumberRow forTableView:self.tableView];
    if (phoneNumber.length > 0) {
        if (![phoneNumber hasPrefix:@"+"]) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Invalid format"
                                                                                     message:@"Phone number should begin with country code. E.g. +1992.."
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            [self presentViewController:alertController
                               animated:YES
                             completion:nil];
        }
    }
	
	NSLog(@"SignUp with Attributes: %@", attributes);
	
	[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_SIGNUP_INPROGRESS_NOTIFICATION object:self];
	
    //sign up the user
    [[self.pool signUp:userName
              password:password
        userAttributes:attributes validationData:nil]
     continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserPoolSignUpResponse *> * _Nonnull task) {
        [[AWSSignInManager sharedInstance] reSignInWithUsername:userName password:password];
        AWSDDLogDebug(@"Successful signUp user: %@",task.result.user.username);
        dispatch_async(dispatch_get_main_queue(), ^{
            if(task.error){
				[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_SIGNUP_ERROR_NOTIFICATION object:self userInfo:@{@"error": task.error}];

                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:task.error.userInfo[@"__type"]
                                                                                         message:task.error.userInfo[@"message"]
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }else if(task.result.user.confirmedStatus != AWSCognitoIdentityUserStatusConfirmed){
				[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_SIGNUP_PENDINGCONFIRM_NOTIFICATION object:self];

				self.sentTo = task.result.codeDeliveryDetails.destination;
                [self performSegueWithIdentifier:@"SignUpConfirmSegue" sender:sender];
            }
            else{
				[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_SIGNUP_SUCCESS_NOTIFICATION object:self];

                [AWSSignInManager sharedInstance].pendingSignIn = YES;
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Registration Complete"
                                                                                         message:@"Registration was successful."
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                }];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }});
        return nil;
    }];
}

@end

@implementation UserPoolSignUpConfirmationViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConfirmCodeReceived:) name:NFAWS_CONFIRMCODE_RECEIVED_NOTIFICATION object:nil];
}

- (void) onConfirmCodeReceived:(NSNotification *) notification {
	NSString *code = notification.userInfo[@"code"];
	self.confirmCodeReceived = code;
	[self onConfirmCode:nil];
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
    _userNameRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"User Name" staticText:self.user.username];
    _confirmationCodeRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Confirmation Code" type:InputTypeText];
    _tableDelegate = [AWSFormTableDelegate new];
    [self.tableDelegate addCell:self.userNameRow];
    [self.tableDelegate addCell:self.confirmationCodeRow];
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    [self.tableView reloadData];
    [AWSAuthUIHelper setUpFormShadowForView:self.tableFormView];
    [self setUpBackground];

    // setup button background
    [AWSAuthUIHelper applyPrimaryColorFromConfig:self.config
                                          toView:self.confirmButton];
    [AWSAuthUIHelper applyPrimaryColorFromConfig:self.config
                                          toView:self.requestCodeButton
                                      background:NO];
}

- (void)setUpBackground {
    self.view.backgroundColor = [AWSAuthUIHelper getSecondaryBackgroundColor];
    self.title = @"Confirm";
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
    backgroundImageView.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (IBAction)onConfirmCode:(id)sender {
	NSString *confirmationCode;
	if (self.confirmCodeReceived) {
		confirmationCode = self.confirmCodeReceived;
	} else {
		confirmationCode = [self.tableDelegate getValueForCell:self.confirmationCodeRow forTableView:self.tableView];
	}
	
    if ([confirmationCode isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing Information"
                                                                                 message:@"Please enter a valid confirmation code."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        return;
    }
	
	[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_CONFIRM_INPROGRESS_NOTIFICATION object:self];
	
    [[self.user confirmSignUp:confirmationCode forceAliasCreation:YES] continueWithBlock: ^id _Nullable(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> * _Nonnull task) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(task.error){
				[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_CONFIRM_ERROR_NOTIFICATION object:self userInfo:@{@"error" : task.error}];

                if(task.error){
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:task.error.userInfo[@"__type"]
                                                                                             message:task.error.userInfo[@"message"]
                                                                                      preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:ok];
                    [self presentViewController:alertController
                                       animated:YES
                                     completion:nil];
                }
            } else {
				[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_CONFIRM_SUCCESS_NOTIFICATION object:self];

                //return to initial screen
                [AWSSignInManager sharedInstance].pendingSignIn = YES;
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Registration Complete"
                                                                                         message:@"Registration was successful."
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

- (IBAction)onResendConfirmationCode:(id)sender {
    //resend the confirmation code
	[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_CONFIRMCODE_RESEND_INPROGRESS_NOTIFICATION object:self];

    [[self.user resendConfirmationCode] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserResendConfirmationCodeResponse *> * _Nonnull task) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(task.error){
				[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_CONFIRMCODE_RESEND_ERROR_NOTIFICATION object:self userInfo:@{@"error" : task.error}];

				UIAlertController *alertController = [UIAlertController alertControllerWithTitle:task.error.userInfo[@"__type"]
                                                                                         message:task.error.userInfo[@"message"]
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }else {
				[[NSNotificationCenter defaultCenter] postNotificationName:NFAWS_CONFIRMCODE_RESEND_SUCCESS_NOTIFICATION object:self];

                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Code Resent"
                                                                                         message:[NSString stringWithFormat:@"Code resent to: %@", task.result.codeDeliveryDetails.destination]
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
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

