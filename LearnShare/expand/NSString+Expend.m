//
//  NSString+Expend.m
//  LearnShare
//
//  Created by toby on 28/12/2016.
//  Copyright © 2016 james. All rights reserved.
//

#import "NSString+Expend.h"

@implementation NSString (Expend)

- (CGSize)getLabSizeWith:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize {
    // 设置文字属性 要和label的一致
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize mSize = CGSizeMake(SCREEN_WIDTH, MAXFLOAT);
    
    // 计算文字占据的高度
    CGSize size = [string boundingRectWithSize:mSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    // 设置label尺寸
    // label.frame = CGRectMake(50, 44, size.width, size.height);
    return size;
}

@end
