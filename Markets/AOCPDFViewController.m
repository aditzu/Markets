//
//  AOCPDFViewController.m
//  Markets
//
//  Created by Andrei Oprea on 22/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import "AOCPDFViewController.h"

@interface AOCPDFViewController ()

@end

@implementation AOCPDFViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [pdfViewer loadData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"complete" ofType: @"pdf"]] MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
    pdfViewer.paginationMode = UIWebPaginationModeLeftToRight;
    pdfViewer.pageLength = 300;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
