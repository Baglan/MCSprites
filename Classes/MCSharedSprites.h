//
//  MCSharedSprites.h
//  MCSprites
//
//  Created by Baglan on 1/10/13.
//  Copyright (c) 2013 MobileCreators. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCSharedSprites : NSObject

+ (MCSharedSprites *)sharedInstance;
- (void)setSpritesForKey:(id<NSCopying>)spritesKey imageName:(NSString *)imageName JSONName:(NSString *)jsonName;
- (UIImage *)imageInSprites:(id<NSCopying>)spritesKey forKey:(id)key;

@end
