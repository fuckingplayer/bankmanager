//
//  LoginView.m
//  财富管家
//
//  Created by anbook on 16/5/26.
//  Copyright © 2016年 anbook. All rights reserved.
//
#define SCREEN_H CGRectGetHeight(self.bounds)
#define SCREEN_W CGRectGetWidth(self.bounds)
#define SCREEN_X CGRectGetMidX(self.bounds)
#define SCREEN_Y CGRectGetMidY(self.bounds)

#import "LoginView.h"

@implementation LoginView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIColor *bgColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"登录灰色背景"]];
        [self setBackgroundColor:bgColor];
        [self initLabel];
        [self initTextField];
        [self initButton];
    }
    return self;
}

- (void)initLabel{
    _userLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 60, 100, 50)];
    _userLabel.text = @"卡(帐)号/用户名";
    _userLabel.textColor = [UIColor whiteColor];
    [_userLabel sizeToFit];
    [self addSubview:_userLabel];
    
    _passLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 130, 100, 50)];
    _passLabel.textColor = [UIColor whiteColor];
    _passLabel.text = @"密                   码";
    [_passLabel sizeToFit];
    [self addSubview:_passLabel];
    
    _remind = [[UILabel alloc]initWithFrame:CGRectMake(40, 210, 300, 30)];
    _remind.textColor = [UIColor whiteColor];
    _remind.text = @"首次登陆,请输入您签约时的主卡卡号以及预留密码。";
    _remind.font = [UIFont systemFontOfSize:14];
    [_remind sizeToFit];
    [self addSubview:_remind];
}
- (void)initTextField{
    _userName = [[UITextField alloc]initWithFrame:CGRectMake(160, 50, 200, 40)];
    _userName.layer.cornerRadius = 5;
    _userName.backgroundColor = [UIColor whiteColor];
    [self addSubview:_userName];
    
    _password = [[UITextField alloc]initWithFrame:CGRectMake(160, 120, 200, 40)];
    _password.backgroundColor = [UIColor whiteColor];
    _password.layer.cornerRadius = 5;

    [self addSubview:_password];
}
- (void)initButton{
    _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];

    _sureButton.bounds = CGRectMake(0, 0, 120, 40);
    _sureButton.center = CGPointMake(120, 300);
    [_sureButton setImage:[UIImage imageNamed:@"登录-确定"] forState:UIControlStateNormal];
    _sureButton.layer.cornerRadius = 5;
    [_sureButton addTarget:self action:@selector(sureButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_sureButton];
    
    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [_cancelButton setImage:[UIImage imageNamed:@"登录-取消"] forState:UIControlStateNormal];
    _cancelButton.bounds = CGRectMake(0, 0, 120, 40);
    _cancelButton.center = CGPointMake(280, 300);
    _cancelButton.layer.cornerRadius = 5;
    [self addSubview:_cancelButton];
    
    _getBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [_getBack setTitle:@"取回用户名" forState:UIControlStateNormal];
    [_getBack setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    _getBack.titleLabel.font = [UIFont systemFontOfSize:16];
    _getBack.bounds = CGRectMake(0, 0, 80, 40);
    _getBack.center = CGPointMake(330, 400);
    _getBack.layer.cornerRadius = 5;
    [self addSubview:_getBack];
}
@end
