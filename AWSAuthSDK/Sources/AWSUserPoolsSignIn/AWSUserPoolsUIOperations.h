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
#import <AWSUserPoolsSignIn/AWSUserPoolsSignIn.h>
#import <AWSAuthCore/AWSUIConfiguration.h>

#define NFAWS_SIGNIN_INPROGRESS_NOTIFICATION   @"NFAWS_SIGNIN_INPROGRESS_NOTIFICATION"
#define NFAWS_SIGNIN_ERROR_NOTIFICATION        @"NFAWS_SIGNIN_ERROR_NOTIFICATION"
#define NFAWS_SIGNIN_SUCCESS_NOTIFICATION      @"NFAWS_SIGNIN_SUCCESS_NOTIFICATION"

#define NFAWS_SIGNUP_INPROGRESS_NOTIFICATION   @"NFAWS_SIGNUP_INPROGRESS_NOTIFICATION"
#define NFAWS_SIGNUP_ERROR_NOTIFICATION        @"NFAWS_SIGNUP_ERROR_NOTIFICATION"
#define NFAWS_SIGNUP_SUCCESS_NOTIFICATION      @"NFAWS_SIGNUP_SUCCESS_NOTIFICATION"
#define NFAWS_SIGNUP_PENDINGCONFIRM_NOTIFICATION @"NFAWS_SIGNUP_PENDINGCONFIRM_NOTIFICATION"

#define NFAWS_CONFIRM_INPROGRESS_NOTIFICATION  @"NFAWS_CONFIRM_INPROGRESS_NOTIFICATION"
#define NFAWS_CONFIRM_ERROR_NOTIFICATION       @"NFAWS_CONFIRM_ERROR_NOTIFICATION"
#define NFAWS_CONFIRM_SUCCESS_NOTIFICATION     @"NFAWS_CONFIRM_SUCCESS_NOTIFICATION"

#define NFAWS_CONFIRMCODE_RESEND_INPROGRESS_NOTIFICATION   @"NFAWS_CONFIRMCODE_RESEND_INPROGRESS_NOTIFICATION"
#define NFAWS_CONFIRMCODE_RESEND_ERROR_NOTIFICATION        @"NFAWS_CONFIRMCODE_RESEND_ERROR_NOTIFICATION"
#define NFAWS_CONFIRMCODE_RESEND_SUCCESS_NOTIFICATION      @"NFAWS_CONFIRMCODE_RESEND_SUCCESS_NOTIFICATION"

#define NFAWS_CONFIRMCODE_RECEIVED_NOTIFICATION      @"NFAWS_CONFIRMCODE_RECEIVED_NOTIFICATION"

#define NFAWS_FORGOTPASSWORD_EMAIL_SUCCESS_NOTIFICATION @"NFAWS_FORGOTPASSWORD_EMAIL_SUCCESS_NOTIFICATION"
#define NFAWS_FORGOTPASSWORD_EMAIL_ERROR_NOTIFICATION @"NFAWS_FORGOTPASSWORD_EMAIL_ERROR_NOTIFICATION"
#define NFAWS_FORGOTPASSWORD_EMAIL_INPROGRESS_NOTIFICATION @"NFAWS_FORGOTPASSWORD_EMAIL_INPROGRESS_NOTIFICATION"

#define NFAWS_FORGOTPASSWORD_UPDATEPASSWORD_SUCCESS_NOTIFICATION @"NFAWS_FORGOTPASSWORD_UPDATEPASSWORD_SUCCESS_NOTIFICATION"
#define NFAWS_FORGOTPASSWORD_UPDATEPASSWORD_ERROR_NOTIFICATION @"NFAWS_FORGOTPASSWORD_UPDATEPASSWORD_ERROR_NOTIFICATION"
#define NFAWS_FORGOTPASSWORD_UPDATEPASSWORD_INPROGRESS_NOTIFICATION @"NFAWS_FORGOTPASSWORD_UPDATEPASSWORD_INPROGRESS_NOTIFICATION"

NS_ASSUME_NONNULL_BEGIN

@interface AWSUserPoolsUIOperations : NSObject

/**
 Initialize UserPools with AuthUIConfiguration
 @param configuration AWSUIConfiguration
 **/
-(id)initWithAuthUIConfiguration:(id<AWSUIConfiguration>)configuration;

/**
 Perform UserPools Login with username, password, completionhandler
 and the navigation controller of the application
 @param     userName            Username
 @param     password            Password
 @param     navController       NavigationController of the application's ViewController
 @param     completionHandler   Callback to the application's ViewController
 **/
-(void)loginWithUserName:(NSString *)userName
                password:(NSString *)password
    navigationController:(UINavigationController *)navController
       completionHandler:(void (^)(id _Nullable result, NSError * _Nullable error))completionHandler;


/**
 Push SignUp ViewController from NavigationController
 @param     navController       NavigationController of the application's ViewController
 **/
-(void)pushSignUpVCFromNavigationController:(UINavigationController *)navController;

/**
 Push ForgotPassword ViewController from NavigationController
 @param     navController       NavigationController of the application's ViewController
 **/
-(void)pushForgotPasswordVCFromNavigationController:(UINavigationController *)navController;

@end

NS_ASSUME_NONNULL_END
