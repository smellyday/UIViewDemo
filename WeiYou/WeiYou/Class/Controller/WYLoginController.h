//
//  WYLoginController.h
//  WeiYou
//
//  Created by zhangpan on 14-6-19.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "ASIFormDataRequest.h"


@interface WYLoginController : UIViewController <UITextFieldDelegate, UIGestureRecognizerDelegate, TencentSessionDelegate, ASIHTTPRequestDelegate> {
    UIActivityIndicatorView *_aiv;
    
	UITextField *_userField;
	UITextField *_passwdField;
    
    TencentOAuth *_tcOAuth;
}

@property (nonatomic, strong) UIActivityIndicatorView *aiv;
@property (nonatomic, strong) UITextField *userField;
@property (nonatomic, strong) UITextField *passwdField;
@property (nonatomic, strong) TencentOAuth *tcOAuth;

@end
