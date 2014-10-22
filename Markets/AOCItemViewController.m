//
//  AOCItemViewController.m
//  Markets
//
//  Created by Andrei Oprea on 22/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import "AOCItemViewController.h"
#import "AOCItem.h"
#import "AOCDataService.h"
#import "AOCWishListDataService.h"

@interface AOCItemViewController ()
{
    AOCItem* _cachedItem;
}

@end

@implementation AOCItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setItem:_cachedItem];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setItem:(AOCItem *)item
{
    _cachedItem = item;
    if(imageView)
    {
        self.navigationItem.title = item.title;
        imageView.image = [UIImage imageNamed:item.URL];
        detailsTextView.text = item.description;
    }
}

-(void)addToWishListPressed:(UIButton *)sender
{
    [[AOCDataService wishListDataService] put:_cachedItem];
    [sender setEnabled:NO];
}

@end
