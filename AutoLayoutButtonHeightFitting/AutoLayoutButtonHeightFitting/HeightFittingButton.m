//
//  HeightFittingButton.m
//  AutoLayoutButtonHeightFitting
//
//  Created by Masayoshi Ukida on 3/30/14.
//  Copyright (c) 2014 Masayoshi Ukida. All rights reserved.
//

#import "HeightFittingButton.h"

@interface HeightFittingButton ()
@property (nonatomic, unsafe_unretained) CGSize contentSize;
@end

@implementation HeightFittingButton


- (void)awakeFromNib
{
    //
    self.backgroundColor = [UIColor redColor];
    
    // ボタンタイトルの複数行対応
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self updateIntrinsicContentSize];
    [self invalidateIntrinsicContentSize];
}

- (void)updateIntrinsicContentSize
{
    // タイトルの高さは期待するものになっているのでこれを期待する高さとする
    self.contentSize = CGSizeMake(CGRectGetWidth(self.frame),
                                  CGRectGetHeight(self.titleLabel.frame));
}

- (CGSize)intrinsicContentSize
{
    return self.contentSize;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // rotate 対応
    [self updateIntrinsicContentSize];
    [self invalidateIntrinsicContentSize];
}

@end
