//
//  NSString+Expend.h
//  LearnShare
//
//  Created by toby on 28/12/2016.
//  Copyright © 2016 james. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Expend)
- (CGSize)getLabSizeWith:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize;
@end
