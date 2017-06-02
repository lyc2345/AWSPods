#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AWSConfiguration.h"
#import "AWSMobileClient.h"
#import "NoSQLModelHelpers.h"
#import "NoSQLSampleDataGenerator.h"
#import "Bookmark.h"
#import "RecentVisit.h"
#import "RecordSuitable.h"
#import "AWSPods.h"
#import "BookmarkManager.h"
#import "LoginManager.h"
#import "PlistManager.h"
#import "SyncManager.h"
#import "Alert.h"
#import "DSWrapper.h"
#import "Encrypt.h"
#import "Random.h"
#import "SignInViewController.h"
#import "UserPoolForgotPasswordViewController.h"
#import "UserPoolMFAViewController.h"
#import "UserPoolSignUpViewController.h"

FOUNDATION_EXPORT double AWSPodsVersionNumber;
FOUNDATION_EXPORT const unsigned char AWSPodsVersionString[];

