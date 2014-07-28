//
//  WYResetPasswordController.h
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYResetPasswordController : UIViewController <UITextFieldDelegate> {
	UITextField *_userPhoneNumberField;
}

@property (nonatomic, strong) UITextField *userPhoneNumberField;

@end
