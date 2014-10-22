//
//  AOCItemsViewController.m
//  Markets
//
//  Created by Andrei Oprea on 21/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import "AOCItemsViewController.h"
#import "AOCTableViewCell.h"
#import "AOCItem.h"
#import "AOCItemViewController.h"
#import "AOCDataService.h"
#import "AOCWishListDataService.h"

@interface AOCItemsViewController ()
{
    NSArray* dataSource;
    NSMutableArray* currentDataSource;
    int points;
}
@end

@implementation AOCItemsViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        dataSource = @[[AOCItem itemWith:@"Cartof" andURL:@"1" description:@"Super cartoful e o para"],
                       [AOCItem itemWith:@"Pra" andURL:@"2" description:@"Cea mai para"],
                       [AOCItem itemWith:@"Banana" andURL:@"3" description:@"Don't look in his eyes"],
                       [AOCItem itemWith:@"Pepen" andURL:@"4" description:@"2 pepene e mai bine"],
                       [AOCItem itemWith:@"Cartof" andURL:@"1" description:@"Super cartoful e o para"],
                       [AOCItem itemWith:@"Pra" andURL:@"2" description:@"Cea mai para"],
                       [AOCItem itemWith:@"Banana" andURL:@"3" description:@"Don't look in his eyes"],
                       [AOCItem itemWith:@"Pepen" andURL:@"4" description:@"2 pepene e mai bine"],
                       [AOCItem itemWith:@"Cartof" andURL:@"1" description:@"Super cartoful"],
                       [AOCItem itemWith:@"Pra" andURL:@"2" description:@"Cea mai para"],
                       [AOCItem itemWith:@"Banana" andURL:@"3" description:@"Don't look in his eyes"],
                       [AOCItem itemWith:@"Pepen" andURL:@"4" description:@"2 pepene e mai bine"],
                       [AOCItem itemWith:@"Cartof" andURL:@"1" description:@"Super cartoful e o para"],
                       [AOCItem itemWith:@"Pra" andURL:@"2" description:@"Cea mai para"],
                       [AOCItem itemWith:@"Banana" andURL:@"3" description:@"Don't look in his eyes"],
                       [AOCItem itemWith:@"Pepen" andURL:@"4" description:@"2 pepene e mai bine"],                      ];
        
        currentDataSource = [NSMutableArray array];
        for (int i = 0; i<3; i++) {
            currentDataSource[i] = dataSource[i];
        }
        points = 1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        pointsLabel.text = [NSString stringWithFormat:@"%i", points];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [currentDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AOCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    if(!cell)
    {
        cell = [[AOCTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ItemCell"];
    }
    cell.rightUtilityButtons = [self rightButtons];
    cell.delegate = self;
    cell.item =  [currentDataSource objectAtIndex:indexPath.row];
    [cell setEnabled:indexPath.row >= currentDataSource.count - 3];
    return cell;
}

-(NSArray*) rightButtons
{
    NSMutableArray * btns = [NSMutableArray array];
    [btns sw_addUtilityButtonWithColor:[UIColor blueColor] title:@"Info"];
    [btns sw_addUtilityButtonWithColor:[UIColor greenColor] title:@"Wish"];

    return btns;
}

-(BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state
{
    AOCItem* item = [dataSource objectAtIndex:[self.tableView indexPathForCell:cell].row];
    BOOL itemIsWished = [[[AOCDataService wishListDataService ]items] containsObject:item];
    [cell.rightUtilityButtons[1] titleLabel].text = itemIsWished?@"Unwish":@"Wish";
    return YES;
}

-(void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            [self performSegueWithIdentifier:@"pushItemSegue" sender:cell];
            break;
        case 1:
        {
            AOCItem* item = [dataSource objectAtIndex:[self.tableView indexPathForCell:cell].row];
            AOCWishListDataService* wishList = [AOCDataService wishListDataService];
            [wishList performSelector:([wishList.items containsObject:item] ? @selector(remove:) : @selector(put:)) withObject:item];
            [cell hideUtilityButtonsAnimated:YES];
            break;
        }
        default:
            break;
    }
    
}

const int MIN_OFFSET = 60;
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    int offset = -( scrollView.contentSize.height - (scrollView.contentOffset.y + scrollView.bounds.size.height) + 60);
   
    if(offset<MIN_OFFSET)
        return;
    int count= [currentDataSource count];
    if (count == dataSource.count) {
        return;
    }
    NSMutableArray* pathArray = [NSMutableArray array];
    for (int i = count; i<count+3; i++) {
        [pathArray addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        currentDataSource[i] = dataSource[i];
    }
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:pathArray.lastObject atScrollPosition:UITableViewScrollPositionTop animated:YES];
    points++;
    pointsLabel.text = [NSString stringWithFormat:@"%i", points];

}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AOCItemViewController* itemVC = (AOCItemViewController*) segue.destinationViewController;
    [itemVC setItem:((AOCTableViewCell*)sender).item];
}

@end
