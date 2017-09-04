//
//  MASExampleAttributeChainingView.m
//  Masonry iOS Examples
//
//  Created by Jonas Budelmann on 31/03/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

#import "MASExampleAttributeChainingView.h"
#import <TPLayout/TPLayout.h>

@implementation MASExampleAttributeChainingView

- (id)init {
    self = [super init];
    if (!self) return nil;

    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self addSubview:greenView];

    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self addSubview:redView];

    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self addSubview:blueView];

    UIView *superview = self;
    UIEdgeInsets padding = UIEdgeInsetsMake(15, 10, 15, 10);


//    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
//        // chain attributes
//        make.top.and.left.equalTo(superview).insets(padding);
//
//        // which is the equivalent of
////        make.top.greaterThanOrEqualTo(superview).insets(padding);
////        make.left.greaterThanOrEqualTo(superview).insets(padding);
//
//        make.bottom.equalTo(blueView.mas_top).insets(padding);
//        make.right.equalTo(redView.mas_left).insets(padding);
//        make.width.equalTo(redView.mas_width);
//
//        make.height.equalTo(@[redView, blueView]);
//    }];
    
    greenView.al_top.equal(superview).insets(padding);
    greenView.al_left.equal(superview).insets(padding);
    
    // which is the equivalent of
    //        make.top.greaterThanOrEqualTo(superview).insets(padding);
    //        make.left.greaterThanOrEqualTo(superview).insets(padding);
    
    greenView.al_bottom.equal(blueView.al_top).insets(padding);
    greenView.al_right.equal(redView.al_left).insets(padding);
    greenView.al_width.equal(redView.al_width);
    
    greenView.al_height.equal(redView);
    greenView.al_height.equal(blueView);
    

//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        // chain attributes
//        make.top.and.right.equalTo(superview).insets(padding);
//
//        make.left.equalTo(greenView.mas_right).insets(padding);
//        make.bottom.equalTo(blueView.mas_top).insets(padding);
//        make.width.equalTo(greenView.mas_width);
//
//        make.height.equalTo(@[greenView, blueView]);
//    }];
    
    redView.al_top.equal(superview).insets(padding);
    redView.al_right.equal(superview).insets(padding);
    
    redView.al_left.equal(greenView.al_right).insets(padding);
    redView.al_bottom.equal(blueView.al_top).insets(padding);
    redView.al_width.equal(greenView.al_width);
    
    redView.al_height.equal(greenView);
    redView.al_height.equal(blueView);

//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(greenView.mas_bottom).insets(padding);
//
//        // chain attributes
//        make.left.right.and.bottom.equalTo(superview).insets(padding);
//
//        make.height.equalTo(@[greenView, redView]);
//    }];
    
    blueView.al_top.equal(greenView.al_bottom).insets(padding);
    
    // chain attributes
    blueView.al_left.equal(superview).insets(padding);
    blueView.al_right.equal(superview).insets(padding);
    blueView.al_bottom.equal(superview).insets(padding);

    blueView.al_height.equal(greenView);
    blueView.al_height.equal(redView);

    return self;
}

@end
