//
//  WYFileManager.h
//  WeiYou
//
//  Created by owen on 11/22/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYFileManager : NSObject

- (void)findAllFiles:(NSString *)docName withLevel:(NSInteger)level;
- (void)createPlistFile:(NSString *)pName;

+ (NSString *)getGeneralXCFilePath;
+ (void)removeGeneralXCFilePath;
+ (NSString *)getCityArrayFilePath;
+ (void)removeCityArrayFilePath;
+ (void)logAllSubviews:(UIView *)mview level:(int)i;

@end
