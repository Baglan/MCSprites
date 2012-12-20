# MCSprites

## Installation

1. Copy files from "Classes" folder to your project;
2. Copy files from "UIImage+Sprite" submodule, located in the "UIImage-Sprite-Additions/Classes" folder to your project.

## Sprite image and data files

This initial version of the class is designed to use files distribuited as a part of a main bundle. Image file will be divided to rectangles of the same size row by row from left to right.

Description file looks like this:

	{
	    "size":{
	        "width":100,
	        "height":100
	    },
	    "sprites":["a","b","c"]
	}

Given the supplied image file, this configuration will translate to 3 sprites, named "a", "b" and "c". Each of them will be taken from the source image starting from left and have a size of 100x100 px.

## Usage

Import the header file:

	#import "MCSprites.h"

Initialize the sprites object:
	
	MCSprites * sprites = [[MCSprites alloc] initWithImageName:@"sample-sprite.png" JSONName:@"sample-sprite.json"];

Extract and use the sprite you need:

    UIImageView * b = [[UIImageView alloc] initWithImage:[sprites imageForKey:@"b"]];

## License

Code and other assets in this project are available under the MIT license.