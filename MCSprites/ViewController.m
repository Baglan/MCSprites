//
//  ViewController.m
//  MCSprites
//
//  Created by Baglan on 12/20/12.
//  Copyright (c) 2012 MobileCreators. All rights reserved.
//

#import "ViewController.h"
#import "MCSprites.h"
#import "MCSharedSprites.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MCSprites * sprites = [[MCSprites alloc] initWithImageName:@"sample-sprite.png" JSONName:@"sample-sprite.json"];
    UIImageView * b = [[UIImageView alloc] initWithImage:[sprites imageForKey:@"b"]];
    [self.view addSubview:b];
    
    [[MCSharedSprites sharedInstance] setSpritesForKey:@"mySprites" imageName:@"sample-sprite.png" JSONName:@"sample-sprite.json"];
    UIImageView * a = [[UIImageView alloc] initWithImage:[[MCSharedSprites sharedInstance] imageInSprites:@"mySprites" forKey:@"a"]];
    a.frame = CGRectMake(100, 0, a.frame.size.width, a.frame.size.height);
    [self.view addSubview:a];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
