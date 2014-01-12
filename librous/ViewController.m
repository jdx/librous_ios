//
//  ViewController.m
//  librous
//
//  Created by Jeff Dickey on 1/11/14.
//  Copyright (c) 2014 dickeyxxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.label.text = @"foobar";
    [[SessionManager sharedManager] GET:@"/"
                             parameters:nil
                                success:^(NSURLSessionDataTask *task, id responseObject) {
                                    self.label.text = responseObject[0];
                                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                    NSLog(@"%@", error);
                                }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
