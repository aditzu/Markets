//
//  AOCWishTableTableViewController.m
//  Markets
//
//  Created by Andrei Oprea on 22/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import "AOCWishTableViewController.h"
#import "AOCDataService.h"
#import "AOCWishListDataService.h"
#import "AOCTableViewCell.h"
#import "AOCItemViewController.h"

@interface AOCWishTableViewController ()
{
    AOCWishListDataService* service;
}

@end

@implementation AOCWishTableViewController


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [AOCDataService registerWishListObserver:self];
    service = [AOCDataService wishListDataService];
}

-(void)dealloc
{
    [AOCDataService unregisterWishListObserver:self];
}

-(void)wishListUpdated{
    [[self tableView] reloadData];
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
    return [[service items] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AOCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WIshListItemCell" forIndexPath:indexPath];
    if(!cell){
        cell = [[AOCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WIshListItemCell"];
    }
    cell.rightUtilityButtons = [self rightButtons];
    cell.delegate = self;
    cell.item =  [[[service items] allObjects] objectAtIndex:indexPath.row];
    
    
    return cell;
}

-(NSArray*) rightButtons
{
    NSMutableArray* btns = [NSMutableArray array];
    [btns sw_addUtilityButtonWithColor:[UIColor blueColor] title:@"Info"];
    [btns sw_addUtilityButtonWithColor:[UIColor redColor] title:@"Unwish"];
    return btns;
}

-(void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            [self performSegueWithIdentifier:@"pushItemSegue" sender:cell];
            break;
        case 1:
            [[AOCDataService wishListDataService] remove:((AOCTableViewCell*)cell).item];
            break;
            
    }
    
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
