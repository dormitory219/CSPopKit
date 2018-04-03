//
//  CSViewController.m
//  CSPopKit
//
//  Created by dormitory219 on 04/03/2018.
//  Copyright (c) 2018 dormitory219. All rights reserved.
//

#import "CSViewController.h"
#import "CSCustomPopManagerTest.h"

@interface CSViewController ()

@end

@implementation CSViewController

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

- (IBAction)testPopView:(id)sender
{
    [CSCustomPopManagerTest testPopView];
}

- (IBAction)testRepeatPop:(id)sender
{
    [CSCustomPopManagerTest testRepeatPop];
}

- (IBAction)testMultiplePop:(id)sender
{
    [CSCustomPopManagerTest testMultiplePop];
}

@end
