//
//  WYRegisterController.h
//  WeiYou
//
//  Created by zhangpan on 14-6-20.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"

@interface WYRegisterController : UIViewController <UITextFieldDelegate, ASIHTTPRequestDelegate> {
	UITextField *_userField;
	UITextField *_passwdField;
}

@property (nonatomic, strong) UITextField *userField;
@property (nonatomic, strong) UITextField *passwdField;


@end
