//
//  HAppDelegate.m
//  AWSPods
//
//  Created by lyc2345 on 05/26/2017.
//  Copyright (c) 2017 lyc2345. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworking/AFNetworking.h>
#import <AWSPods/Random.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  NSLog(@"Network reachable: %s", [AFNetworkReachabilityManager sharedManager].isReachable == YES ? "YES" : "NO");
  
  NSLog(@"random: %@", [Random string]);
  
  return YES;
}


@end
