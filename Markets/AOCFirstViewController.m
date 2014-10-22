//
//  AOCFirstViewController.m
//  Markets
//
//  Created by Andrei Oprea on 20/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import "AOCFirstViewController.h"
#import "AOCCatalogViewController.h"

@interface AOCFirstViewController ()
{
    NSArray* dataSource;
    
    
}

@end

@implementation AOCFirstViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        dataSource = @[@"Kaufland",@"Tesco",@"Carrefour",@"Billa",@"Lidl",@"Fotex",@"Auchan",@"Cora",@"MegaIMAGE"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

static NSString* cellID = @"MarketCell";

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


@end
