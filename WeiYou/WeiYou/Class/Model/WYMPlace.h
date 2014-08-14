//
//  WYMPlace.h
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMPlace : NSObject {
    NSNumber *_ID;
    NSNumber *_parentID;
    NSString *_name;
}

@property (nonatomic, readonly) NSNumber *ID;
@property (nonatomic, readonly) NSNumber *parentID;
@property (nonatomic, readonly) NSString *name;

- (id)initWithInfoDic:(NSDictionary *)infoDic;
- (id)initWithID:(NSNumber *)mid parentID:(NSNumber *)pid name:(NSString *)mname;
- (id)initWithOtherPlace:(WYMPlace *)place;

@end
