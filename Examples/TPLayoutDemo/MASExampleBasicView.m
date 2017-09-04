//
//  MASExampleBasicView.m
//  Masonry
//
//  Created by Jonas Budelmann on 21/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASExampleBasicView.h"
#import <TPLayout/TPLayout.h>

@implementation MASExampleBasicView

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
    int padding = 10;

    //if you want to use Masonry without the mas_ prefix
    //define MAS_SHORTHAND before importing Masonry.h see Masonry iOS Examples-Prefix.pch
//    [greenView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.greaterThanOrEqualTo(superview.top).offset(padding);
//        make.left.equalTo(superview.left).offset(padding);
//        make.bottom.equalTo(blueView.top).offset(-padding);
//        make.right.equalTo(redView.left).offset(-padding);
//        make.width.equalTo(redView.width);
//
//        make.height.equalTo(redView.height);
//        make.height.equalTo(blueView.height);
//        
//    }];
    
    greenView.al_top.greaterOrEqual(superview.al_top).offset(padding);
    greenView.al_left.equal(superview.al_left).offset(padding);
    greenView.al_bottom.equal(blueView.al_top).offset(-padding);
    greenView.al_right.equal(redView.al_left).offset(-padding);
    greenView.al_width.equal(redView.al_width);
    
    greenView.al_height.equal(redView.al_height);
    greenView.al_height.equal(blueView.al_height);
    

    //with is semantic and option
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(superview.mas_top).with.offset(padding); //with with
//        make.left.equalTo(greenView.mas_right).offset(padding); //without with
//        make.bottom.equalTo(blueView.mas_top).offset(-padding);
//        make.right.equalTo(superview.mas_right).offset(-padding);
//        make.width.equalTo(greenView.mas_width);
//        
//        make.height.equalTo(@[greenView, blueView]); //can pass array of views
//    }];
    
    redView.al_top.equal(superview.al_top).offset(padding);
    redView.al_left.equal(greenView.al_right).offset(padding);
    redView.al_bottom.equal(blueView.al_top).offset(-padding);
    redView.al_right.equal(superview.al_right).offset(-padding);
    redView.al_width.equal(greenView.al_width);
    
    redView.al_height.equal(greenView.al_height);
    redView.al_height.equal(blueView.al_height);
    
    
//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(greenView.mas_bottom).offset(padding);
//        make.left.equalTo(superview.mas_left).offset(padding);
//        make.bottom.equalTo(superview.mas_bottom).offset(-padding);
//        make.right.equalTo(superview.mas_right).offset(-padding);
//        make.height.equalTo(@[greenView.mas_height, redView.mas_height]); //can pass array of attributes
//    }];
    
    blueView.al_top.equal(greenView.al_bottom).offset(padding);
    blueView.al_left.equal(superview.al_left).offset(padding);
    blueView.al_bottom.equal(superview.al_bottom).offset(-padding);
    blueView.al_right.equal(superview.al_right).offset(-padding);
    blueView.al_height.equal(greenView.al_height);
    blueView.al_height.equal(redView.al_height);

    
    return self;
}

@end
