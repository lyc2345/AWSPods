//
//  NoSQLSampleDataGenerator.m
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
#import "NoSQLSampleDataGenerator.h"

static NSString *const NoSQLSampleDataGeneratorSampleDataStringPrefix = @"demo-";
static u_int32_t const NoSQLSampleDataGeneratorSampleDataNumberMinimum = 1111000000;
static u_int32_t const NoSQLSampleDataGeneratorSampleDataNumberMaximum = 1111999999;
static u_int32_t const NoSQLSampleDataGeneratorRandomNumberMaximum = NoSQLSampleDataGeneratorSampleDataNumberMaximum - NoSQLSampleDataGeneratorSampleDataNumberMinimum;
static u_int8_t const NoSQLSampleDataGeneratorSampleDataPartition = 4;

static NSArray<NSString *> *NoSQLSampleDataGeneratorSampleStringValues = nil;

@implementation NoSQLSampleDataGenerator

+ (void)initialize {
    [super initialize];

    NoSQLSampleDataGeneratorSampleStringValues = @[@"apple", @"banana", @"orange", @"pear", @"pineapple", @"lemon",
                                                   @"cherry", @"avocado", @"blueberry", @"raspberry", @"grape", @"watermelon", @"papaya"];
}

#pragma mark - Internal methods

+ (u_int32_t)randomNumber {
    return arc4random_uniform(NoSQLSampleDataGeneratorRandomNumberMaximum);
}

#pragma mark - Partition methods

+ (NSNumber *)randomPartitionSampleNumber {
    return @(NoSQLSampleDataGeneratorSampleDataNumberMinimum + arc4random_uniform(NoSQLSampleDataGeneratorSampleDataPartition) + 1);
}

+ (NSString *)randomPartitionSampleStringWithAttributeName:(NSString *)attributeName {
    return [NSString stringWithFormat:@"%@%@-%d", NoSQLSampleDataGeneratorSampleDataStringPrefix, attributeName, arc4random_uniform(NoSQLSampleDataGeneratorSampleDataPartition) + 1];
}

+ (NSData *)randomPartitionSampleBinary {
    return [[NSString stringWithFormat:@"%@-%06llu", NoSQLSampleDataGeneratorSampleDataStringPrefix, [[self randomPartitionSampleNumber] unsignedLongLongValue]] dataUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - General methods

+ (NSNumber *)randomSampleNumber {
    return @(NoSQLSampleDataGeneratorSampleDataNumberMinimum + [self randomNumber]);
}

+ (NSString *)randomSampleStringWithAttributeName:(NSString *)attributeName {
    return [NSString stringWithFormat:@"%@%@-%06d", NoSQLSampleDataGeneratorSampleDataStringPrefix, attributeName, [self randomNumber]];
}

+ (NSNumber *)randomSampleBOOL {
    return @([self randomNumber] % 2 == 0);
}

+ (NSData *)randomSampleBinary {
    return [[NSString stringWithFormat:@"%@-%06d", NoSQLSampleDataGeneratorSampleDataStringPrefix, [self randomNumber]] dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSSet<NSString *> *)randomSampleStringSet {
    return [NSSet setWithArray:[self randomSampleStringArray]];
}

+ (NSSet<NSNumber *> *)randomSampleNumberSet {
    NSMutableArray *numberArray = [NSMutableArray new];
    u_int32_t arrayCount = arc4random_uniform((u_int32_t)[NoSQLSampleDataGeneratorSampleStringValues count]) + 1;
    for (NSUInteger i = 0; i < arrayCount; i++) {
        [numberArray addObject:[self randomSampleNumber]];
    }
    return [NSSet setWithArray:numberArray];
}

+ (NSSet<NSData *> *)randomSampleBinarySet {
    NSMutableArray *binaryArray = [NSMutableArray new];
    for (NSString *string in [self randomSampleStringArray]) {
        [binaryArray addObject:[string dataUsingEncoding:NSUTF8StringEncoding]];
    }
    return [NSSet setWithArray:binaryArray];
}

+ (NSArray<NSString *> *)randomSampleStringArray {
    NSRange range = NSMakeRange((u_int32_t)[NoSQLSampleDataGeneratorSampleStringValues count] / 3,
                                arc4random_uniform((u_int32_t)[NoSQLSampleDataGeneratorSampleStringValues count] / 3) + 1);
    return [NoSQLSampleDataGeneratorSampleStringValues subarrayWithRange:range];
}

+ (NSDictionary<NSString *, NSString *> *)randomSampleMap {
    NSMutableDictionary *stringDictionary = [NSMutableDictionary new];
    u_int32_t dictionaryCount = arc4random_uniform((u_int32_t)[NoSQLSampleDataGeneratorSampleStringValues count]) + 1;
    for (NSUInteger i = 0; i < dictionaryCount; i++) {
        NSString *key = NoSQLSampleDataGeneratorSampleStringValues[i];
        [stringDictionary setObject:[self randomSampleStringWithAttributeName:key] forKey:key];
    }
    return [NSDictionary dictionaryWithDictionary:stringDictionary];
}

@end
