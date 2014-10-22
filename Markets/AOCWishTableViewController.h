//
//  AOCWishTableTableViewController.h
//  Markets
//
//  Created by Andrei Oprea on 22/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AOCDataService.h"
#import "SWCells/SWTableViewCell.h"

@interface AOCWishTableViewController : UITableViewController <AOCWishListProtocol, SWTableViewCellDelegate>

@end
