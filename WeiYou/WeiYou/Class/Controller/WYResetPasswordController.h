//
//  WYResetPasswordController.h
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"

@interface WYResetPasswordController : UIViewController <UITextFieldDelegate, ASIHTTPRequestDelegate> {
	UITextField *_phoneNumberField;
}

@property (nonatomic, strong) UITextField *phoneNumberField;

@end
