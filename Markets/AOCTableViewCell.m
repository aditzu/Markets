//
//  AOCTableViewCell.m
//  Markets
//
//  Created by Andrei Oprea on 21/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import "AOCTableViewCell.h"

@implementation AOCTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}


-(void)setItem:(AOCItem*) item{
    _item = item;
    itemLabel.text = item.title;
    [itemPhoto setImage:[UIImage imageNamed:item.URL]];

}

-(void)setEnabled:(BOOL)enabled
{
    [itemLabel setEnabled:enabled];
    self.backgroundColor = enabled ? [UIColor colorWithRed:198/255.f green:231/255.f blue:247/255.f alpha:1.0f] : [UIColor lightGrayColor];
}

@end
