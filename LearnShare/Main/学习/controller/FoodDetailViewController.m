//
//  FoodDetailViewController.m
//  LearnShare
//
//  Created by xian on 2016/11/4.
//  Copyright © 2016年 james. All rights reserved.
//

#import "FoodDetailViewController.h"

@interface FoodDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSArray *dataArray;
@end

@implementation FoodDetailViewController

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count+2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UITableViewCell alloc]init];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UITableView *tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
    
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, 280+30)];
    tab.tableHeaderView =headerView;
    
    
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, headerView.width, 200)];
    imgView.image = [UIImage imageNamed:@"meishi.jpg"];
    [headerView addSubview:imgView];
    
    UIView *detailView = [[UIView alloc]initWithFrame:CGRectMake(0, imgView.xx_bottom, headerView.width, 80)];
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, detailView.width-10, 35)];
    [headerView addSubview:detailView];
    
    titleLab.text = @"好伦哥西餐厅";
    titleLab.font = [UIFont boldSystemFontOfSize:19];
    [detailView addSubview:titleLab];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, titleLab.xx_bottom, detailView.width-10, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [detailView addSubview:lineView];
    
    UILabel *addLab = [[UILabel alloc]initWithFrame:CGRectMake(10, lineView.xx_bottom, detailView.width, 30)];
    addLab.text = @"北京市***************************";
    addLab.font = [UIFont systemFontOfSize:14];
    [detailView addSubview:addLab];
    
    UIImageView *phoneImgView = [[UIImageView alloc]initWithFrame:CGRectMake(detailView.width-40, lineView.xx_bottom+6, 23, 23)];
    phoneImgView.image = [UIImage imageNamed:@"电话.png"];
    [detailView addSubview:phoneImgView];
    
    UILabel *userTalkLab = [[UILabel alloc]initWithFrame:CGRectMake(0, addLab.xx_bottom, screenW, 30)];
    userTalkLab.textAlignment = NSTextAlignmentCenter;
    userTalkLab.font = [UIFont systemFontOfSize:15];
    userTalkLab.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    userTalkLab.text = @"- 用户评价 -";
    [detailView addSubview:userTalkLab];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
