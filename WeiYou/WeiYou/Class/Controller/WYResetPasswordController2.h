//
//  WYResetPasswordController2.h
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"

@interface WYResetPasswordController2 : UIViewController <UITextFieldDelegate, ASIHTTPRequestDelegate> {
    NSString *_phoneNumber;
    
	UITextField *_verifyNumberTextField;
	UITextField *_inputPWTextField;
	UITextField *_reInputPWTextField;
}

@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) UITextField *verifyNumberTextField;
@property (nonatomic, strong) UITextField *inputPWTextField;
@property (nonatomic, strong) UITextField *reInputPWTextField;

@end
