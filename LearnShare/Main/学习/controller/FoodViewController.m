//
//  FoodViewController.m
//  LearnShare
//
//  Created by xian on 2016/11/3.
//  Copyright © 2016年 james. All rights reserved.
//

#import "FoodViewController.h"
#import "FoodTableViewCell.h"
#import "FoodDetailViewController.h"


@interface FoodViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,strong) FoodDetailViewController *detailController;
@end

@implementation FoodViewController

- (FoodDetailViewController *)detailController{
    if(!_detailController){
        _detailController = [[FoodDetailViewController alloc]init];
    }
    return _detailController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tab.delegate = self;
    tab.dataSource = self;
//    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tab registerNib:[UINib nibWithNibName:@"FoodTableViewCell" bundle:nil] forCellReuseIdentifier:@"foodCell"];
    [self.view addSubview:tab];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count+12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (FoodTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foodCell" forIndexPath:indexPath];
   
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
self.detailController.title = @"XX食府";
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController: self.detailController animated:YES];
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
