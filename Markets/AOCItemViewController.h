//
//  AOCItemViewController.h
//  Markets
//
//  Created by Andrei Oprea on 22/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AOCItem;

@interface AOCItemViewController : UIViewController
{
    IBOutlet UIImageView * imageView;
    IBOutlet UITextView * detailsTextView;
}

-(void)setItem:(AOCItem*) item;
-(IBAction)addToWishListPressed:(UIButton*)sender;
@end
