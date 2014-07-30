//
//  WYRegisterController2.h
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"

@interface WYRegisterController2 : UIViewController <UITextFieldDelegate, ASIHTTPRequestDelegate> {
    NSString *_phoneNumber;
    NSString *_password;
    
	UITextField *_verifyField;
}

@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) UITextField *verifyField;

@end
