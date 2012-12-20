//
//  ViewController.m
//  MCSprites
//
//  Created by Baglan on 12/20/12.
//  Copyright (c) 2012 MobileCreators. All rights reserved.
//

#import "ViewController.h"
#import "MCSprites.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
