//
//  AOCTableViewCell.h
//  Markets
//
//  Created by Andrei Oprea on 21/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWCells/SWTableViewCell.h"
#import "AOCItem.h"


@interface AOCTableViewCell : SWTableViewCell
{
    IBOutlet UILabel* itemLabel;
    IBOutlet UIImageView* itemPhoto;
}

@property (nonatomic,weak) AOCItem* item;

-(void) setEnabled:(BOOL) enabled;
@end
