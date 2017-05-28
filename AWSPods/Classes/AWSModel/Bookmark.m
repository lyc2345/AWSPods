//
//  Bookmark.m
//  MySampleApp
//
//
// Copyright 2017 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-objc v0.16
//


#import "Bookmark.h"
@import AWSMobileHubHelper;
#import "NoSQLSampleDataGenerator.h"
#import <sys/utsname.h>


@implementation Bookmark

+ (NSString *)dynamoDBTableName {

    return @"comick-mobilehub-2020998507-Bookmark";
}

+ (NSString *)hashKeyAttribute {

    return @"_userId";
}

+ (NSString *)rangeKeyAttribute {

    return @"_id";
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
               @"_userId" : @"userId",
               @"_id" : @"id",
               @"_commitId" : @"commitId",
							 @"_remoteHash" : @"remoteHash",
               @"_dicts" : @"dicts",
             };
}



@end
