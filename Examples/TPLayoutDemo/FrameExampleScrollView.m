//
//  FrameExampleScrollView.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "FrameExampleScrollView.h"
#import <TPLayout/TPLayout.h>


@interface FrameExampleScrollView ()
@property (strong, nonatomic) UIScrollView* scrollView;
@end

@implementation FrameExampleScrollView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    UIScrollView *scrollView = UIScrollView.new;
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor grayColor];
    [self addSubview:scrollView];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.scrollView edgesToView:self offsetEdge:UIEdgeInsetsZero];
    
    [self generateContent];

    return self;
}

- (void)generateContent {
    UIView* contentView = UIView.new;
    [self.scrollView addSubview:contentView];
    
    UIView *lastView;
    CGFloat height = 25;
    
    for (int i = 0; i < 10; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        [self.scrollView addSubview:view];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        [view addGestureRecognizer:singleTap];
        
        view.tp_size = CGSizeMake(self.scrollView.tp_width, height);
        view.tp_top = lastView.tp_bottom;
        view.tp_left = 0;
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        height += 25;
        lastView = view;
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.tp_width, lastView.tp_bottom);
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)singleTap:(UITapGestureRecognizer*)sender {
    [sender.view setAlpha:sender.view.alpha / 1.20]; // To see something happen on screen when you tap :O
    [self.scrollView scrollRectToVisible:sender.view.frame animated:YES];
};

@end
