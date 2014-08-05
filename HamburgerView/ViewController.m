//
//  ViewController.m
//  HamburgerView
//
//  Created by Wan Ahmad Lutfi Wan Md Hatta on 5/08/14.
//  Copyright (c) 2014 bijokmind. All rights reserved.
//

#import "ViewController.h"
#import "HamburgerView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet HamburgerView *hamburgerView;

@end

@implementation ViewController

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

- (IBAction)animate:(id)sender {
    [self.hamburgerView startAllAnimations:nil];
}


@end
