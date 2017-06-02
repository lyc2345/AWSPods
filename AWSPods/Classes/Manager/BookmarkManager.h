//
//  BookmarkManager.h
//  LoginManager
//
//  Created by Stan Liu on 16/03/2017.
//  Copyright © 2017 Stan Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AWSDynamoDB;
@import AWSMobileHubHelper;
#import "RecordSuitable.h"

typedef NS_ENUM(NSInteger, RecordType) {
	RecordTypeBookmark = 0,
	RecordTypeRecentlyVisit = 1
};

@interface BookmarkManager : NSObject

@end

@interface BookmarkManager (Offline)

-(NSDictionary *)getOfflineRecordOfIdentity:(NSString *)identity type:(RecordType)type;
-(void)addOffline:(NSDictionary *)r type:(RecordType)type ofIdentity:(NSString *)identity;
-(NSDictionary *)deleteOffline:(NSDictionary *)r type:(RecordType)type ofIdentity:(NSString *)identity;

@end

@interface BookmarkManager (AWS)



#pragma mark (Open API)

/**
 pull Bookmark or RecentlyVisit data by userId and Class

 @param aClass AWS Model Class
 @param userId AWS identityID
 @param completionHandler The handler will be ran once the task is completion.
 */
-(void)pull:(Class)aClass withUser:(NSString *)userId completion:(void(^)(NSArray *items, NSError *error))completionHandler;


/**
 1. It will compare record and shadow first and generate a client_shadow_diff
 2. If client's commit Id equal to remote's, it will push the diff to remote on AWS
 3. If commit Id is not the same.
 4. pull remote
 5. diff remote and client, apply remote diff into client, 
 6. apply first client_shadow_diff into remote_client = new remote_client
 7. diff new remote_client and remote, also apply client_shadow_diff into remote_client
 8. push the diffs by remote diff new_remote_client

 @param record AWS model class that conforms RecordSuitable protocol
 @param type type of AWS's model
 @param mergeCompletion The handler will be ran once the task is completion.
 */
-(void)mergePushWithRecord:(id<RecordSuitable>)record type:(RecordType)type completion:(void(^)(NSError *error))mergeCompletion;



/**
 1. It will compare record and shadow first and generate a client_shadow_diff
 2. If client's commit Id equal to remote's, it will push the diff to remote on AWS
 3. If commit Id is not the same.
 4. pull remote
 5. diff remote and client, apply remote diff into client,
 6. apply first client_shadow_diff into remote_client = new remote_client
 7. diff new remote_client and remote, also apply client_shadow_diff into remote_client
 8. push the diffs by remote diff new_remote_client

 @param object The dictionary of Bookmark or RecentlyVisit
 @param commitId commit id if you wanna control your commit id by yourself
 @param remoteHash remote hash for detect server is reseted or not
 @param type Bookmark or RecentlyVisit
 @param userId AWS identity id
 @param mergeCompletion return error
 */
-(void)mergePushWithObjct:(NSArray *)object commitId:(NSString *)commitId remoteHash:(NSString *)remoteHash type:(RecordType)type ofUserId:(NSString *)userId completion:(void(^)(NSError *error))mergeCompletion;

@end
