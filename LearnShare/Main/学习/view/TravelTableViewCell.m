//
//  TravelTableViewCell.m
//  LearnShare
//
//  Created by xian on 2016/11/8.
//  Copyright © 2016年 james. All rights reserved.
//

#import "TravelTableViewCell.h"

@interface TravelTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *markLab;

@end
@implementation TravelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.nameLab.font = [UIFont boldSystemFontOfSize:16];
    self.commentLab.font = [UIFont systemFontOfSize:14];
    self.addressLab.font = [UIFont systemFontOfSize:15];
    
    self.markLab.layer.cornerRadius = 10;
    self.markLab.layer.masksToBounds = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
