//
//  MCSprites.m
//  MCSprites
//
//  Created by Baglan on 12/20/12.
//  Copyright (c) 2012 MobileCreators. All rights reserved.
//

#import "MCSprites.h"

@interface MCSprites () {
    __strong NSArray * _sprites;
    __strong NSArray * _keys;
}

@end

@implementation MCSprites

// Based on code from https://github.com/r3econ/UIImage-Sprite-Additions
- (NSArray *)extractSpritesFromImage:(UIImage *)image spriteSize:(CGSize)size
{
    NSMutableArray * tempArray = [NSMutableArray array];
    
    CGFloat scale = image.scale;
    
    int cols = ceilf(image.size.width / size.width);
    int rows = ceilf(image.size.height / size.height);
    
    CGImageRef imageRef = [image CGImage];
    for (int row = 0; row < rows; row++) {
        for (int col = 0; col < cols; col++) {
            CGImageRef sprite = CGImageCreateWithImageInRect(imageRef, CGRectMake(size.width * scale * col, size.height * scale * row, size.width * scale, size.height * scale));
            [tempArray addObject:[UIImage imageWithCGImage:sprite scale:scale orientation:UIImageOrientationUp]];
            CGImageRelease(sprite);
        }
    }
    
    return [NSArray arrayWithArray:tempArray];
}

- (id)initWithImageName:(NSString *)imageName JSONName:(NSString *)jsonName
{
    self = [super init];
    if (self) {
        NSData * data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:jsonName ofType:nil]];
        NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSDictionary * sizeDictionary = dictionary[@"size"];
        CGSize size = CGSizeMake([sizeDictionary[@"width"] floatValue], [sizeDictionary[@"height"] floatValue]);
        
        _keys = dictionary[@"sprites"];
        
        _sprites = [self extractSpritesFromImage:[UIImage imageNamed:imageName] spriteSize:size];
    }
    return self;
}

- (UIImage *)imageForKey:(id)key
{
    @try {
        return _sprites[[_keys indexOfObject:key]];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

@end
