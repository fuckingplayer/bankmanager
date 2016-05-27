//
//  ViewController.m
//  财富管家
//
//  Created by anbook on 16/5/25.
//  Copyright © 2016年 anbook. All rights reserved.
//

#import "ViewController.h"
#import "LeftTableViewCell.h"
#import "HomeViewController.h"
#import "LoginView.h"
static NSString *const indentifer = @"option";
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UITableView *optionsList;
//未登陆数据源
@property (nonatomic,strong)NSArray *unloginListArray;
//登陆数据源
@property (nonatomic,strong)NSArray *loginListArray;
//未登录icon
@property (nonatomic,strong)NSArray *unloginImageArray;
//登陆icon
@property (nonatomic,strong)NSArray *loginImageArray;
//登陆类数组
@property (nonatomic,strong)NSArray * unloginClassArray;
@property (nonatomic,strong)NSArray *unloginDownClassArray;
@property (nonatomic,strong)NSArray *loginClassArray;
@property (nonatomic,strong)NSArray *loginDownClassArray;
@property (nonatomic,strong)NSArray *unloginDownImageArray;
@property (nonatomic,strong)NSArray *loginDownImageArray;
//是否已经登陆
@property (nonatomic,assign)BOOL isLogin;
//蒙版按钮
@property (nonatomic,strong)UIButton *maskButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self initData];
    [self initUI];
}
/**
 *  初始化界面
 */
- (void)initUI{

   
}
/**
 *  初始化数据
 */
- (void)initData{
    _unloginListArray = @[@"首页",@"金融资讯",@"理财服务",@"银行卡",@"代理产品",@"我的网银"];
    _loginListArray = @[@"首页",@"金融资讯",@"理财服务",@"银行卡",@"缴费服务",@"代理产品",@"我的网银",@"活动交流",@"日程提醒",@"业务咨询"];
    _loginDownClassArray = @[@"设置",@"登出",@"Ver:1.1.0"];
    _unloginDownClassArray = @[@"登录",@"Ver:1.1.0"];
    _unloginDownImageArray = @[@"登录-1",@"滑动-1"];
    _loginDownImageArray = @[@"设置-1",@"登出-1",@"滑动-1"];
    _unloginImageArray = @[@"首页-1",@"金融资讯-1",@"理财服务-1",@"银行卡-1",@"代理产品-1",@"我的网银-1"];
    _loginImageArray = @[@"首页-1",@"金融资讯-1",@"理财服务-1",@"银行卡-1",@"缴费服务-1",@"代理产品-1",@"我的网银-1",@"活动交流-1",@"日程提醒-1",@"业务咨询-1"];
    _unloginClassArray = @[@"HomeViewController",@"FinancialNewsViewController",@"ManageServiceViewController",@"CardViewController",@"DelegateViewController",@"MyAccountViewController"];
    _loginClassArray = @[@"HomeViewController",@"FinancialNewsViewController",@"ManageServiceViewController",@"CardViewController",@"PayViewController",@"DelegateViewController",@"MyAccountViewController",@"ActivityViewController",@"ScheduleViewController",@"ConsoleViewController"];
    
    _isLogin = NO;
}
#pragma mark --initializeTableView
- (void)initTableView{
    //注册cell
    [self.optionsList registerNib:[UINib nibWithNibName:NSStringFromClass([LeftTableViewCell class]) bundle:nil] forCellReuseIdentifier:indentifer];
    _optionsList.scrollEnabled = NO;
}
//为每一行设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 75.0;
}
//设置 header 的高 
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 80;
    }else{
        if (_isLogin) {
            return 30;
        }
    }
    return 370;
}
//自定义 header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *aView = [UIView new];
    aView.backgroundColor = [UIColor colorWithRed:106/255.0 green:69/255.0 blue:25/255.0 alpha:1];

    if (section == 0) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
        imageView.image = [UIImage imageNamed:@"头像"];
        [aView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, 150, 30)];
        label.text = @"尊敬的用户,晚上";
        label.textColor = [UIColor whiteColor];
        [aView addSubview:label];
    }
    
    return aView;
}
#pragma mark -- tableViewDelegate
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        if (_isLogin) {
            return 10;
        }else{
            return 6;
        }
    }
    if (section == 1) {
        if (_isLogin) {
            return 3;
        }
    }
    return 2;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer];
    cell.optionLabel.textColor = [UIColor colorWithRed:194/255.0 green:174/255.0 blue:23/255.0 alpha:1];
    if (indexPath.section == 0) {
        if (_isLogin) {
            cell.optionLabel.text = _loginListArray[indexPath.row];
            cell.optionImage.image = [UIImage imageNamed:_loginImageArray[indexPath.row]];
        }else{
            cell.optionLabel.text = _unloginListArray[indexPath.row];
            cell.optionImage.image = [UIImage imageNamed:_unloginImageArray[indexPath.row]];
        }

    }else{
        if (_isLogin) {
            cell.optionLabel.text = _loginDownClassArray[indexPath.row];
            cell.optionImage.image = [UIImage imageNamed:_loginDownImageArray[indexPath.row]];
        }else{
            cell.optionLabel.text = _unloginDownClassArray[indexPath.row];
            cell.optionImage.image = [UIImage imageNamed:_unloginDownImageArray[indexPath.row]];
        
        }
    }
       return cell;
}
#pragma mark --tableViewSelectedAction
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.rightView.subviews.count >= 1) {
            [[self.rightView.subviews objectAtIndex:_rightView.subviews.count - 1] removeFromSuperview];
    }

    if (!_isLogin) {
        if (indexPath.section == 1&&indexPath.row == 0) {
            [self loginViewShow];
        }
        Class controllerClass = NSClassFromString(_unloginClassArray[indexPath.row]);
        UIViewController *viewController = [[controllerClass alloc] init];
        viewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(_rightView.bounds), CGRectGetHeight(_rightView.bounds));
        [_rightView addSubview:viewController.view];
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panPiece:)];
        [panGesture setMaximumNumberOfTouches:1];
        [viewController.view addGestureRecognizer:panGesture];
        [_rightView addSubview:viewController.view];
        [self addChildViewController:viewController];
    }else{
        Class controllerClass = NSClassFromString(_loginClassArray[indexPath.row]);
        UIViewController *viewController = [[controllerClass alloc] init];
        viewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(_rightView.bounds), CGRectGetHeight(_rightView.bounds));
        [_rightView addSubview:viewController.view];
            UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panPiece:)];
            [panGesture setMaximumNumberOfTouches:1];
            [viewController.view addGestureRecognizer:panGesture];
        [self addChildViewController:viewController];
    
    }
   
}
#pragma mark --交互手势
- (void)panPiece:(UIPanGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan||recognizer.state == UIGestureRecognizerStateChanged) {
        if (recognizer.state == UIGestureRecognizerStateBegan) {
            
            CGPoint volecity = [recognizer velocityInView: _rightView];
            if (volecity.x < 0) {
                return;
            }
        }else if (recognizer.state == UIGestureRecognizerStateChanged){
            
            CGPoint translation = [recognizer translationInView:_rightView];
            
            CGFloat rate = translation.x / CGRectGetWidth(_rightView.bounds);
            if (rate >= 0.3) {
                [self openDrawer];
            }else {
                [self closeDrawer];
            }
        }else if (recognizer.state == UIGestureRecognizerStateCancelled || recognizer.state == UIGestureRecognizerStateEnded) {
            
            CGPoint translation = [recognizer translationInView:_rightView];
            
            CGFloat rate = translation.x / CGRectGetWidth(_rightView.bounds);
            
            if (rate >= 0.5) {
                [self openDrawer];
            }else {
                [self closeDrawer];
            }
        }
        
    }
}
#pragma mark -- 响应方法
- (void)openDrawer{
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        _rightView.frame = CGRectMake(230, 0, CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds));
    } completion:^(BOOL finished) {
    }];
}
- (void)closeDrawer{
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        _rightView.frame = CGRectMake(65, 0, CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds));
    } completion:^(BOOL finished) {
        
    }];
}


- (void)loginViewShow{
    [self.view addSubview:self.maskButton];
    LoginView *login = [[LoginView alloc]init];
    login.bounds = CGRectMake(0, 0, 400, 500);
    login.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    [self.view addSubview:login];
}
- (UIButton *)maskButton {
    if (!_maskButton) {
        _maskButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _maskButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _maskButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        [_maskButton addTarget:self action:@selector(closeDrawer) forControlEvents:UIControlEventTouchUpInside];
    }
    return _maskButton;
}

@end
