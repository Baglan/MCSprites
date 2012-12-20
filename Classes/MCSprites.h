//
//  MCSprites.h
//  MCSprites
//
//  Created by Baglan on 12/20/12.
//  Copyright (c) 2012 MobileCreators. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCSprites : NSObject

- (id)initWithImageName:(NSString *)imageName JSONName:(NSString *)jsonName;
- (UIImage *)imageForKey:(id)key;

@end
