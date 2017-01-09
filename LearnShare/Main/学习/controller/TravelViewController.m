//
//  TravelViewController.m
//  LearnShare
//
//  Created by xian on 2016/11/3.
//  Copyright © 2016年 james. All rights reserved.
//

#import "TravelViewController.h"
#import "TravelTableViewCell.h"
#import "TravelDetailViewController.h"
@interface TravelViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,strong) TravelDetailViewController *detailController;
@end

@implementation TravelViewController

- (TravelDetailViewController *)detailController{
    if(!_detailController){
        _detailController = [[TravelDetailViewController alloc]init];
    }
    return _detailController;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tab.delegate = self;
    tab.dataSource = self;
//    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tab registerNib:[UINib nibWithNibName:@"TravelTableViewCell" bundle:nil] forCellReuseIdentifier:@"TraveCell"];
    [self.view addSubview:tab];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count+12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}
- (TravelTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TravelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TraveCell" forIndexPath:indexPath];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.detailController.title = @"XX景点";
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
