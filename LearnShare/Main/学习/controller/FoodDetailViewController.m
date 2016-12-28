//
//  FoodDetailViewController.m
//  LearnShare
//
//  Created by xian on 2016/11/4.
//  Copyright © 2016年 james. All rights reserved.
//

#import "FoodDetailViewController.h"

@interface FoodDetailViewController ()

@end

@implementation FoodDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
 

    [self.view addSubview:scrollView];
    
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, scrollView.width, 200)];
    imgView.image = [UIImage imageNamed:@"compose_emoticonbutton_background_highlighted.png"];
    [scrollView addSubview:imgView];
    
    UIView *detailView = [[UIView alloc]initWithFrame:CGRectMake(0, imgView.xx_bottom, scrollView.width, 80)];
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, detailView.width, 30)];
    [scrollView addSubview:detailView];
    
    titleLab.text = @"好伦哥西餐厅";
    [detailView addSubview:titleLab];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, titleLab.xx_bottom, detailView.width, 1)];
    lineView.backgroundColor = [UIColor grayColor];
    [detailView addSubview:lineView];
    
    UILabel *addLab = [[UILabel alloc]initWithFrame:CGRectMake(0, lineView.xx_bottom, detailView.width, 30)];
    addLab.text = @"北京市*******************************";
    [detailView addSubview:addLab];
    
    UIImageView *phoneImgView = [[UIImageView alloc]initWithFrame:CGRectMake(detailView.width-40, lineView.xx_bottom, 30, 30)];
    phoneImgView.image = [UIImage imageNamed:@"电话.png"];
    [detailView addSubview:phoneImgView];
    
    
    UIView *commentView = [[UIView alloc]initWithFrame:CGRectMake(0,detailView.xx_bottom, detailView.width, 80)];
    UILabel *commentLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, commentView.width, 30)];
    commentLab.text = @"评论:";
    
    [commentView addSubview:commentLab];
    
    
    [scrollView addSubview:commentView];
        scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, commentView.xx_bottom);
    
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
