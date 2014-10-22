//
//  AOCCatalogViewController.m
//  Markets
//
//  Created by Andrei Oprea on 20/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import "AOCCatalogViewController.h"

@interface AOCCatalogViewController ()
{
    NSArray* dataSource;
}

@end

@implementation AOCCatalogViewController


-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        dataSource = @[@"Electronics",@"Food",@"House",@"Clothes"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

static NSString* cellID = @"CatalogCell";

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = dataSource[indexPath.row];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{return 1;}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{return [dataSource count];};

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    AOCCatalogViewController* catalogController = (AOCCatalogViewController*)[segue destinationViewController];
//    UITableViewCell* cell = (UITableViewCell*) sender;
//}



@end
