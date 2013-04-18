//
//  ACViewController.m
//  MaltDemo
//
//  Created by Arnaud Coomans on 3/19/13.
//  Copyright (c) 2013 acoomans. All rights reserved.
//

#import "ACViewController.h"
#import "UIApplication+Malt.h"

@interface ACViewController ()

@end

@implementation ACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.textView.text = [[UIApplication sharedApplication] provisioningProfileContent];
    
    if ([[UIApplication sharedApplication] isStoreDistributionApplication]) {
        self.label.textColor = [UIColor greenColor];
        self.label.text = @"Store Distribution";
        
    } else if ([[UIApplication sharedApplication] isSimulatorApplication]) {
        self.label.textColor = [UIColor orangeColor];
        self.label.text = @"Simulator";
        self.textView.text = @"Try me on a real device, silly";
        
    } else {
        self.label.textColor = [UIColor redColor];
        self.label.text = @"Development or Adhoc Distribution";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
