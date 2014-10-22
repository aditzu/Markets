//
//  AOCItemsViewController.h
//  Markets
//
//  Created by Andrei Oprea on 21/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWCells/SWTableViewCell.h"

@interface AOCItemsViewController : UITableViewController <UIScrollViewDelegate, SWTableViewCellDelegate>
{
    IBOutlet UILabel* pointsLabel;
}
@end
