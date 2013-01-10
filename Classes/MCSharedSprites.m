//
//  MCSharedSprites.m
//  MCSprites
//
//  Created by Baglan on 1/10/13.
//  Copyright (c) 2013 MobileCreators. All rights reserved.
//

#import "MCSharedSprites.h"
#import "MCSprites.h"

@implementation MCSharedSprites {
    NSMutableDictionary * _sprites;
}

// Singleton
// Taken from http://lukeredpath.co.uk/blog/a-note-on-objective-c-singletons.html
+ (MCSharedSprites *)sharedInstance
{
    __strong static id _sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self) {
        _sprites = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)setSpritesForKey:(id<NSCopying>)spritesKey imageName:(NSString *)imageName JSONName:(NSString *)jsonName
{
    MCSprites * sprites = [[MCSprites alloc] initWithImageName:imageName JSONName:jsonName];
    [_sprites setObject:sprites forKey:spritesKey];
}

- (UIImage *)imageInSprites:(id<NSCopying>)spritesKey forKey:(id)key
{
    MCSprites * sprites = [_sprites objectForKey:spritesKey];
    return [sprites imageForKey:key];
}

@end
