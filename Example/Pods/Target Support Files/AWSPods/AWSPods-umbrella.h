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
#import "Alert.h"
#import "DSWrapper.h"
#import "Encrypt.h"
#import "Random.h"

FOUNDATION_EXPORT double AWSPodsVersionNumber;
FOUNDATION_EXPORT const unsigned char AWSPodsVersionString[];

