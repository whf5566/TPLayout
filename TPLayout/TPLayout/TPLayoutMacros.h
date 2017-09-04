//
//  TPLayoutMacros.h
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/13.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#ifndef __TPAutolayoutMacro_h
#define __TPAutolayoutMacro_h

#define equal(...) equal(TPBoxValue((__VA_ARGS__)))
#define greaterOrEqual(...) greaterOrEqual(TPBoxValue((__VA_ARGS__)))
#define lessOrEqual(...) lessOrEqual(TPBoxValue((__VA_ARGS__)))

#define al_update(attr) attr.update()
#define al_reset(attr)  attr.reset()

#define TPBoxValue(value) _TPBoxValue(@encode(__typeof__((value))), (value))


#ifndef TPSYNTH_DUMMY_CLASS
#define TPSYNTH_DUMMY_CLASS(_name_) \
@interface TPSYNTH_DUMMY_CLASS_ ## _name_ : NSObject @end \
@implementation TPSYNTH_DUMMY_CLASS_ ## _name_ @end
#endif

/**
 *  Given a scalar or struct value, wraps it in NSValue
 *  Based on EXPObjectify: https://github.com/specta/expecta
 *  copy from Masonry: https://github.com/SnapKit/Masonry
 */
FOUNDATION_STATIC_INLINE id _TPBoxValue(const char *type, ...) {
    va_list v;
    va_start(v, type);
    id obj = nil;
    if (strcmp(type, @encode(id)) == 0) {
        id actual = va_arg(v, id);
        obj = actual;
    } else if (strcmp(type, @encode(CGPoint)) == 0) {
        CGPoint actual = (CGPoint)va_arg(v, CGPoint);
        obj = [NSValue value:&actual withObjCType:type];
    } else if (strcmp(type, @encode(CGSize)) == 0) {
        CGSize actual = (CGSize)va_arg(v, CGSize);
        obj = [NSValue value:&actual withObjCType:type];
    } else if (strcmp(type, @encode(UIEdgeInsets)) == 0) {
        UIEdgeInsets actual = (UIEdgeInsets)va_arg(v, UIEdgeInsets);
        obj = [NSValue value:&actual withObjCType:type];
    } else if (strcmp(type, @encode(double)) == 0) {
        double actual = (double)va_arg(v, double);
        obj = [NSNumber numberWithDouble:actual];
    } else if (strcmp(type, @encode(float)) == 0) {
        float actual = (float)va_arg(v, double);
        obj = [NSNumber numberWithFloat:actual];
    } else if (strcmp(type, @encode(int)) == 0) {
        int actual = (int)va_arg(v, int);
        obj = [NSNumber numberWithInt:actual];
    } else if (strcmp(type, @encode(long)) == 0) {
        long actual = (long)va_arg(v, long);
        obj = [NSNumber numberWithLong:actual];
    } else if (strcmp(type, @encode(long long)) == 0) {
        long long actual = (long long)va_arg(v, long long);
        obj = [NSNumber numberWithLongLong:actual];
    } else if (strcmp(type, @encode(short)) == 0) {
        short actual = (short)va_arg(v, int);
        obj = [NSNumber numberWithShort:actual];
    } else if (strcmp(type, @encode(char)) == 0) {
        char actual = (char)va_arg(v, int);
        obj = [NSNumber numberWithChar:actual];
    } else if (strcmp(type, @encode(bool)) == 0) {
        bool actual = (bool)va_arg(v, int);
        obj = [NSNumber numberWithBool:actual];
    } else if (strcmp(type, @encode(unsigned char)) == 0) {
        unsigned char actual = (unsigned char)va_arg(v, unsigned int);
        obj = [NSNumber numberWithUnsignedChar:actual];
    } else if (strcmp(type, @encode(unsigned int)) == 0) {
        unsigned int actual = (unsigned int)va_arg(v, unsigned int);
        obj = [NSNumber numberWithUnsignedInt:actual];
    } else if (strcmp(type, @encode(unsigned long)) == 0) {
        unsigned long actual = (unsigned long)va_arg(v, unsigned long);
        obj = [NSNumber numberWithUnsignedLong:actual];
    } else if (strcmp(type, @encode(unsigned long long)) == 0) {
        unsigned long long actual = (unsigned long long)va_arg(v, unsigned long long);
        obj = [NSNumber numberWithUnsignedLongLong:actual];
    } else if (strcmp(type, @encode(unsigned short)) == 0) {
        unsigned short actual = (unsigned short)va_arg(v, unsigned int);
        obj = [NSNumber numberWithUnsignedShort:actual];
    }
    va_end(v);
    return obj;
}

FOUNDATION_STATIC_INLINE BOOL TPIsXAxisLayoutAttribute(NSLayoutAttribute attr) {
    return attr == NSLayoutAttributeLeading
    || attr == NSLayoutAttributeTrailing
    || attr == NSLayoutAttributeLeft
    || attr == NSLayoutAttributeRight
    || attr == NSLayoutAttributeCenterX
    || attr == NSLayoutAttributeLeadingMargin
    || attr == NSLayoutAttributeTrailingMargin
    || attr == NSLayoutAttributeLeftMargin
    || attr == NSLayoutAttributeRightMargin
    || attr == NSLayoutAttributeCenterXWithinMargins;
}

FOUNDATION_STATIC_INLINE BOOL TPIsYAxisLayoutAttribute(NSLayoutAttribute attr) {
    return attr == NSLayoutAttributeTop
    || attr == NSLayoutAttributeBottom
    || attr == NSLayoutAttributeCenterY
    || attr == NSLayoutAttributeBaseline
    || attr == NSLayoutAttributeLastBaseline
    || attr == NSLayoutAttributeFirstBaseline
    || attr == NSLayoutAttributeTopMargin
    || attr == NSLayoutAttributeBottomMargin
    || attr == NSLayoutAttributeCenterYWithinMargins;
}

FOUNDATION_STATIC_INLINE BOOL TPIsDimensionLayoutAttribute(NSLayoutAttribute attr) {
    return attr == NSLayoutAttributeWidth || attr == NSLayoutAttributeHeight;
}

FOUNDATION_STATIC_INLINE BOOL TPIsLayoutAttributesSuited(NSLayoutAttribute attr1, NSLayoutAttribute attr2) {
    return attr1 == attr2
    || (TPIsXAxisLayoutAttribute(attr1) && TPIsXAxisLayoutAttribute(attr2))
    || (TPIsYAxisLayoutAttribute(attr1) && TPIsYAxisLayoutAttribute(attr2))
    || (TPIsDimensionLayoutAttribute(attr1) && TPIsDimensionLayoutAttribute(attr2));
}

#endif
