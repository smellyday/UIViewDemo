//
//  WYFileManager.m
//  WeiYou
//
//  Created by owen on 11/22/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYFileManager.h"
#import <math.h>
#import "consts.h"

@implementation WYFileManager


- (void)findAllFiles:(NSString *)docName withLevel:(NSInteger)level {
	
	if (level == 0) {
		mlog(@"Document path: %@", docName);
		mlog(@"\n");
	}
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *fileArr = [fileManager contentsOfDirectoryAtPath:docName error:nil];
	
	if ([fileArr count] != 0) {
		
		NSString *tmp = @"";
		double cn = pow(2, level) > 8 ? 8 : pow(2, level);
		for (int i = 0; i < cn; i++) {
			tmp = [NSString stringWithFormat:@"%@--", tmp];
		}
		
		for (NSString *fileName in fileArr) {
			if (level == 0) {
				mlog(@"\n");
			}
			mlog(@"level- %ld: %@ %@", (long)level, tmp, fileName);
			
			NSString *mPath = [NSString stringWithFormat:@"%@/%@", docName, fileName];
			NSArray *fileArr2 = [fileManager contentsOfDirectoryAtPath:mPath error:nil];
			if ([fileArr2 count] != 0) {
				[self findAllFiles:mPath withLevel:level+1];
			}
			
		}
		
	}
}

- (void)createPlistFile:(NSString *)pName {
	NSMutableDictionary *data = [NSMutableDictionary dictionaryWithCapacity:10];
	[data setObject:@"hello" forKey:@"hello"];
	
	NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
	NSString *path = [NSString stringWithFormat:@"%@/%@", bundlePath, pName];
	mlog(@"plist path: %@", path);
	
	NSArray *pArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *path2 = [NSString stringWithFormat:@"%@/%@", [pArr objectAtIndex:0], pName];
	mlog(@"plist path2: %@", path2);
	
	[[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
	[data writeToFile:path atomically:YES];
	
	NSDictionary *dic2 = [NSDictionary dictionaryWithContentsOfFile:path];
	mlog(@"dic2: %@", dic2);
	
	mlog(@"user name: %@", NSUserName());
	mlog(@"user name: %@", NSFullUserName());
}


+ (NSString *)getGeneralXCFilePath {
	NSArray *parr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *gnrFilePath = [NSString stringWithFormat:@"%@/%@", [parr objectAtIndex:0], WY_FILE_TRIPS];
	
	return gnrFilePath;
}

+ (void)removeGeneralXCFilePath {
	
}

+ (NSString *)getCityArrayFilePath {
	NSArray *parr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *cityFilePath = [NSString stringWithFormat:@"%@/%@", [parr objectAtIndex:0], WY_FILE_CITIES];
	return cityFilePath;
}

+ (void)removeCityArrayFilePath {
	NSFileManager *mf = [NSFileManager defaultManager];
	NSArray *parr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *cityFilePath = [NSString stringWithFormat:@"%@/%@", [parr objectAtIndex:0], WY_FILE_CITIES];
	[mf removeItemAtPath:cityFilePath error:nil];
}

+ (void)logAllSubviews:(UIView *)mview level:(int)i {
	
	NSLog(@"level : %d, view : %@", i, [[mview class] description]);
	
	NSArray *viewarr = [mview subviews];
	i++;
	for (UIView *mv in viewarr) {
		[WYFileManager logAllSubviews:mv level:i];
	}
}


@end
