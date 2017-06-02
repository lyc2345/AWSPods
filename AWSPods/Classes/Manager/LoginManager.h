//
//  LoginManager.h
//  LoginManager
//
//  Created by Stan Liu on 16/03/2017.
//  Copyright © 2017 Stan Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWSMobileHubHelper/AWSMobileHubHelper.h"
#import "AWSCognitoIdentityProvider/AWSCognitoIdentityProvider.h"


@interface LoginManager : NSObject

+(LoginManager *)shared;

#pragma mark - Offline Login properties

-(NSString *)user;
-(BOOL)isLogin;
-(NSString *)offlineIdentity;

#pragma mark - AWS Login Delegate handler

// MARK: AWSCognitoIdentityInteractiveAuthenticationDelegate delegate
@property (copy, nonatomic) id<AWSCognitoIdentityMultiFactorAuthentication>(^startMultiFactorAuthenticationHandler)();

// MARK: AWSCognitoIdentityPasswordAuthentication Delegate
@property (copy, nonatomic) void(^authenticationUsernameHandler)(NSString *lastKnownUsername);
@property (copy, nonatomic) void(^didCompletePasswordAuthenticationStepWithErrorHandler)(NSError *error);

// MARK: AWSCognitoIdentityMultiFactorAuthentication Delegate
@property (nonatomic, copy)	void(^getMultiFactorAuthenticationCode)(AWSCognitoIdentityMultifactorAuthenticationInput *authenticationInput, AWSTaskCompletionSource<NSString *>* mfaCodeCompletionSource);
@property (nonatomic, copy) void(^multifactorAuthenticationStepWithError)(NSError *error);

// To receive user info from Textfield.
@property (copy, nonatomic) NSString *(^userPoolSignInFlowStartUserName)();
@property (copy, nonatomic) NSString *(^userPoolSignInFlowStartPassword)();

// For AWS login status change block. Implement this in where you want to show user is login or not.
@property (copy, nonatomic) void(^AWSLoginStatusChangedHandler)();

@end

#pragma mark - Offline Extension

@interface LoginManager (Offline)

-(void)loginOfflineWithUser:(NSString *)user password:(NSString *)password completion:(void(^)(NSError *error))completion;
-(void)logoutOfflineCompletion:(void(^)(NSError *error))completion;

@end

#pragma mark - AWS Extension

@interface LoginManager (AWS) <AWSCognitoIdentityInteractiveAuthenticationDelegate,
																					AWSCognitoIdentityPasswordAuthentication,
																									AWSCognitoUserPoolsSignInHandler,
																			 AWSCognitoIdentityMultiFactorAuthentication>

/**
 Check AWS login status

 @return AWS login status
 */
-(BOOL)isAWSLogin;

/**
 Obtain AWS Identity Id of current user.
 
 @return The Identity Id generated By AWS
 */
-(NSString *)awsIdentityId;

-(NSString *)awsDidSignInNotificationName;
-(NSString *)awsDidSignOutNotificationName;

/**
 Sign up AWS

 @param username username
 @param password password
 @param email email
 @param telephone telephone
 @param confirmAction The Action if user want to do next step of Sign up
 @param successHandler The Action if Sign up successfully.
 @param failHandler The Action if Sign up failure.
 */
-(void)signUpWithUser:(NSString *)username
						password:(NSString *)password
								email:(NSString *)email
									tel:(NSString *)telephone
				waitToConfirm:(void(^)(NSString *destination))confirmAction
							success:(void(^)())successHandler
								 fail:(void(^)(NSError *error))failHandler;


-(void)confirmSignUpWithUser:(NSString *)username
								 confirmCode:(NSString *)confirmCode
										 success:(void(^)())successHandler
												fail:(void(^)(NSError *error))failHandler;

-(void)onResendOfUser:(NSString *)username
							Success:(void(^)(NSString *destination))successHandler
								 fail:(void(^)(NSError *error))failHandler;

-(void)confirmForgotNewPassword:(NSString *)newPassword
										confirmCode:(NSString *)confirmCode
												success:(void(^)())successHandler
													 fail:(void(^)(NSError *error))failHandler;

-(void)forgotPasswordOfUser:(NSString *)username
								 completion:(void(^)(NSError *error))completion;

-(void)login:(void(^)(id result, NSError * error))completion;

-(void)logout:(void(^)(id result, NSError *error))completion;

//TODO: Not implement MFA login (everytime send confirma code when login.)
@end
