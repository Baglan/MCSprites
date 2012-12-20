//
//  MCSprites.m
//  MCSprites
//
//  Created by Baglan on 12/20/12.
//  Copyright (c) 2012 MobileCreators. All rights reserved.
//

#import "MCSprites.h"
#import "UIImage+Sprite.h"

@interface MCSprites () {
    __strong NSArray * _sprites;
    __strong NSArray * _keys;
}

@end

@implementation MCSprites

- (id)initWithImageName:(NSString *)imageName JSONName:(NSString *)jsonName
{
    self = [super init];
    if (self) {
        NSData * data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:jsonName ofType:nil]];
        NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSDictionary * sizeDictionary = dictionary[@"size"];
        CGSize size = CGSizeMake([sizeDictionary[@"width"] floatValue], [sizeDictionary[@"height"] floatValue]);
        
        _keys = dictionary[@"sprites"];
        
        UIImage * spritesImage = [UIImage imageNamed:imageName];
        _sprites = [spritesImage spritesWithSpriteSheetImage:spritesImage inRange:NSMakeRange(0, _keys.count) spriteSize:size];
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
