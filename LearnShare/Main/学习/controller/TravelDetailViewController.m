//
//  TravelDetailViewController.m
//  LearnShare
//
//  Created by xian on 2016/11/8.
//  Copyright © 2016年 james. All rights reserved.
//

#import "TravelDetailViewController.h"


@interface TravelDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UIImageView *bannerImgView;
@property(nonatomic,strong) NSArray *dataArray;

//@property(nonatomic,strong)
@end

@implementation TravelDetailViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
 
}
- (void)viewDidLoad {
    [super viewDidLoad];
       self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVBAR_HEIGHT) style:UITableViewStylePlain];
    tab.dataSource = self;
    tab.delegate = self;
    
    [self.view addSubview:tab];
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 260)];
    headView.backgroundColor = [UIColor yellowColor];
    tab.tableHeaderView = headView;
    
    _bannerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 220)];
    _bannerImgView.userInteractionEnabled = YES;
    _bannerImgView.tag = 1;

    [headView addSubview:_bannerImgView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(30,_bannerImgView.xx_bottom, SCREEN_WIDTH-30, 40)];
    lab.text = @"120条蜂友评论";
    lab.tag = 2;
    lab.userInteractionEnabled = YES;
    lab.font = [UIFont boldSystemFontOfSize:17];
    [headView addSubview:lab];
    
    UIImageView *moreImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"more"]];
    moreImage.frame = CGRectMake(lab.xx_right-60, 5, 23, 23);
    
    [lab addSubview:moreImage];
    
    UITapGestureRecognizer *bannerImgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [_bannerImgView addGestureRecognizer:bannerImgTap];
    UITapGestureRecognizer *moreTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [lab addGestureRecognizer:moreTap];
    
    
    
    self.dataArray = @[@"UIFont用于获取和设置字体信息。这个类提供用于输出的字体的属性和字型信息。我们可以把其对象像参数一样传入函数中。字体是图形用户界面显示文本的基础。Cocoa在UIKit框架中为开发者提供了高层次的API以及方便的枚举、加载和使用字体。Cocoa Touch 使用UIFont 类来封装字体。每个iOS设备都内置了系统字体。字体被组织成字体族科（Families），每个族科又包含字样（Faces）。例如，Helvetica 是一个字体族科，Helvetica Bold是Helvetica族科中的一个字样。常用方法介绍一般而言我们不需要用alloc，int方法初始化UIFont对象，我们用UIFont大部分的时候是用其类方法，这些方法会设置对象的属性，且返回一个字体对象。+fontWithName:(NSString *)fontName   size:(CGFloat) fontSize   创建并且返回一个指定字体类型和大小的字体对象，fontName指定字体集的名字和风格（例如宋体，楷书等这一类型的），fontsize设置字体的大小。-fontWithSize:返回字体的大小+ (UIFont *)systemFontOfSize:(CGFloat)fontSize    使用标准的接口返回指定大小的字体对象。+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize   返回字体对象使用了标准接口来指定字体大小附加黑体风格。+ (CGFloat)buttonFontSize 返回按钮使用标准字体。",@"fdsafdsafdsa"];

}


- (void)tap:(UITapGestureRecognizer *)tap {
    UIView *temp = tap.view;
    
    switch (temp.tag) {
        case 1:{
            //
            
            NSLog(@"img");
            break;
        }
        case 2:{
            //
            NSLog(@"more");
            break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
      NSString *content = self.dataArray[indexPath.row];
    CGSize size = [content getLabSizeWith:content font:[UIFont systemFontOfSize:15] maxSize:CGSizeZero];
    return size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    
    NSString *content = self.dataArray[indexPath.row];
    UILabel *lab = [[UILabel alloc]init];
    lab.font = [UIFont systemFontOfSize:15];
    lab.text = content;
    lab.numberOfLines = 0;
    CGSize size = [content getLabSizeWith:content font:[UIFont systemFontOfSize:15] maxSize:CGSizeZero];
    lab.frame = CGRectMake(0, 0, size.width, size.height);
    [cell addSubview:lab];
   // cell.textLabel.text = [NSString stringWithFormat:@"index :%ld",(long)indexPath.row];
    return cell;
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
