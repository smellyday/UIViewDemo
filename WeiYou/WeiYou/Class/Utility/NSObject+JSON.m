//
//  NSObject+JSON.m
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "NSObject+JSON.h"
#import "consts.h"

@implementation NSObject (JSON)

- (NSString *)toJSONString {
	NSError *err = nil;
	NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&err];
	
	if (err == nil && [jsonData length]>0) {
		NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
		mlog(@"JSON STRING : \n%@", jsonStr);
		return jsonStr;
	}
	
	return nil;
}

@end
