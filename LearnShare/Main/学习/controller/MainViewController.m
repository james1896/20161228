//
//  LearnViewController.m
//  LearnShare
//
//  Created by James on 16/8/28.
//  Copyright © 2016年 james. All rights reserved.
//

#import "MainViewController.h"

#import "XNLoopBannerView.h"
#import "MainTableViewCell.h"


#import "FoodViewController.h"
#import "LiftViewController.h"
#import "TravelViewController.h"


#import "Masonry.h"

//29 169 252
@interface MainViewController ()<XNLoopBannerViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)  XNLoopBannerView *bannerView;
@property(nonatomic,strong)  UIView *handerView;

@property(nonatomic,strong) UITableView *tabView;
@property(nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property(nonatomic,strong) NSArray *dataArray;
@end

@implementation MainViewController

#pragma mark -- lift cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@{@"title":@"攻略1"},
                                        @{@"title":@"攻略2"},
                                        @{@"title":@"攻略3"},
                                        @{@"title":@"攻略4"}];
    [self.view addSubview:self.tabView];
//    [self.view addSubview:self.collectionView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CAGradientLayer *)shadowAsInverse
{
    CAGradientLayer *newShadow = [[CAGradientLayer alloc] init];
    CGRect newShadowFrame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height);
    newShadow.frame = newShadowFrame;
    //添加渐变的颜色组合（颜色透明度的改变）
    newShadow.colors = [NSArray arrayWithObjects:
                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0] CGColor] ,
                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.1] CGColor],
                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.2] CGColor],
                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.3] CGColor],
                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.4] CGColor],
                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.5] CGColor],
                        nil];
    
    newShadow.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.3],
                           [NSNumber numberWithFloat:0.8],
                           [NSNumber numberWithFloat:1.0],
                           nil];
    newShadow.startPoint = CGPointMake(1, 0);
    newShadow.endPoint = CGPointMake(0, 1);
    return newShadow;
}

#pragma mark -- XNLoopBannerViewDelegate

- (void)bannerViewReadButtonPress:(UIButton *)sender{
    NSLog(@"read more");
}

- (void)bannerView:(XNLoopBannerView *)bannerView didSelectAtIndex:(NSInteger)index{
    NSLog(@"index:%d",index);
}
#pragma mark -- http

- (void)updateViewData{
    self.bannerView.imageUrls = @[@"http://www.feizl.com/upload2007/2012_04/120414144943121.jpg",
                                 @"http://img2.3lian.com/2014/f2/124/d/53.jpg",
                                 @"http://img.bimg.126.net/photo/vTj1tKBi8UViyJye0EyMYw==/5785155196335487580.jpg",
                                 @"http://cnm.szdwyy.com/uploads/allimg/140107/24-14010G63AX29.png"];
}
#pragma mark -- tabview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   
    
    NSDictionary *dict = self.dataArray[indexPath.row];
    cell.titleLab.text = [NSString stringWithFormat:@"%@",dict[@"title"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{



}

- (void)buttonViewPress:(UIButton *)sender{
    
    UIViewController *controller = nil;
    switch (sender.tag) {
        case 0:{
            FoodViewController *food = [[FoodViewController alloc]init];
         
            controller = food;
         break;
        }
        case 1:{
            FoodViewController *food = [[FoodViewController alloc]init];
           
            controller = food;
            break;
        }
        case 2:{
            FoodViewController *food = [[FoodViewController alloc]init];
            
            controller = food;
            break;
        }
        case 3:{
            TravelViewController *travel = [[TravelViewController alloc]init];
            
            controller = travel;
            break;
        }
    }
    
    if(controller){
        controller.hidesBottomBarWhenPushed = YES;
        controller.title = sender.titleLabel.text;
        
        [self.navController pushViewController:controller animated:YES];
    }
}

#pragma mark -- 懒加载

- (UIView *)handerView{
    if(!_handerView){
        _handerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, 300)];
        UIView *buttonView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, 270)];

        UIButton *leftUp = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftUp setTitle:@"美食" forState:UIControlStateNormal];
        
        leftUp.backgroundColor = [UIColor redColor];
        UIButton *rightUp = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightUp setTitle:@"休闲" forState:UIControlStateNormal];
        rightUp.backgroundColor = [UIColor greenColor];
        
        UIButton *leftDown = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftDown setTitle:@"生活" forState:UIControlStateNormal];
         leftDown.backgroundColor = [UIColor yellowColor];
        
        UIButton *rightDown = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightDown setTitle:@"旅游" forState:UIControlStateNormal];
         rightDown.backgroundColor = [UIColor blueColor];
        
        
        leftUp.tag = 0;
        rightUp.tag = 1;
        leftDown.tag = 2;
        rightDown.tag = 3;
        
        [leftUp addTarget:self action:@selector(buttonViewPress:) forControlEvents:UIControlEventTouchUpInside];
         [rightUp addTarget:self action:@selector(buttonViewPress:) forControlEvents:UIControlEventTouchUpInside];
         [leftDown addTarget:self action:@selector(buttonViewPress:) forControlEvents:UIControlEventTouchUpInside];
         [rightDown addTarget:self action:@selector(buttonViewPress:) forControlEvents:UIControlEventTouchUpInside];
        
        
        leftUp.frame = CGRectMake(0, 0, buttonView.width/2, buttonView.height/2);
        rightUp.frame = CGRectMake(buttonView.width/2,0, buttonView.width/2, buttonView.height/2);
        leftDown.frame = CGRectMake(0, buttonView.height/2, buttonView.width/2, buttonView.height/2);
        rightDown.frame = CGRectMake( buttonView.width/2,buttonView.height/2, buttonView.width/2, buttonView.height/2);
        
        [buttonView addSubview:leftUp];
        [buttonView addSubview:leftDown];
        [buttonView addSubview:rightUp];
        [buttonView addSubview:rightDown];
        
        [_handerView addSubview:buttonView];
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 270, _handerView.width, 30)];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = [UIFont systemFontOfSize:13];
        lab.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
        lab.text = @"- 猜你喜欢 -";
        [_handerView addSubview:lab];
        
//        [leftUp mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(leftUp.superview).with.mas_offset(0);
//            make.top.equalTo(leftUp.superview).with.mas_offset(0);
//            make.width.equalTo(rightUp);
//            make.height.equalTo(leftDown);
//            make.height.equalTo(rightUp);
//            
//        }];
//        [rightUp mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(rightUp.superview).with.mas_offset(0);
//            make.top.equalTo(rightUp.superview).with.mas_offset(0);
//            
//        }];
//        
//        [leftDown mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(leftUp.superview).with.mas_offset(0);
//            make.bottom.equalTo(leftUp.superview).with.mas_offset(0);
//            
//            make.width.equalTo(rightDown);
//            make.height.equalTo(rightDown);
//        }];
//        [rightDown mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(rightUp.superview).with.mas_offset(0);
//            make.bottom.equalTo(rightUp.superview).with.mas_offset(0);
//            
//        }];
    }
    return _handerView;
}

- (UITableView *)tabView{
    if(!_tabView){
        _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT-NAVBAR_HEIGHT-STATUSBAR_HEIGHT) style:UITableViewStylePlain];
//        [_tabView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.tabView registerNib:[UINib
                                     nibWithNibName:NSStringFromClass([MainTableViewCell class])
                                   bundle:nil] forCellReuseIdentifier:@"cell"];
        _tabView.delegate = self;
        _tabView.dataSource = self;
        _tabView.tableHeaderView = self.handerView;
    }
    return _tabView;
}
- (XNLoopBannerView *)bannerView{
    if(!_bannerView){
        _bannerView = [[XNLoopBannerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180) imageUrls:
                                                                                                                        @[@"http://www.feizl.com/upload2007/2012_04/120414144943121.jpg",
                                                                                                                            @"http://img2.3lian.com/2014/f2/124/d/53.jpg",
                                                                                                                            @"http://img.bimg.126.net/photo/vTj1tKBi8UViyJye0EyMYw==/5785155196335487580.jpg",
                                                                                                                            @"http://cnm.szdwyy.com/uploads/allimg/140107/24-14010G63AX29.png"]];
        _bannerView.animationDuration = 5;
        _bannerView.bannerDelegate = self;
          //    bannerView.placeholderImage
    }
    return _bannerView;
}

@end
