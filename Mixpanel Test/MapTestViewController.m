//
//  MapTestViewController.m
//  Mixpanel Test
//
//  Created by Renaud Tircher on 01/22/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MapTestViewController.h"
#import "Mixpanel.h"

@interface MapTestViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)buttonClicked:(id)sender;

@property NSInteger counter;


@end

@implementation MapTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)buttonClicked:(id)sender {
    self.counter++;
    Mixpanel *mixpanel = [Mixpanel sharedInstance];
    [mixpanel track: [NSString stringWithFormat: @"Button Clicked", self.counter]];
    [mixpanel.people increment:@"Button Clicked" by:[NSNumber numberWithInt:self.counter]];
    self.label.text = [NSString stringWithFormat:@"Clicked :%i", self.counter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end