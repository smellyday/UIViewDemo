//
//  WYRegisterController2.h
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYRegisterController2 : UIViewController <UITextFieldDelegate> {
	UITextField *_phoneNumberField;
	UITextField *_verifyField;
}

@property (nonatomic, strong) UITextField *phoneNumberField;
@property (nonatomic, strong) UITextField *verifyField;

@end
