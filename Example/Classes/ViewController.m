//
//  ViewController.m
//  CJAHandler
//
//  Created by Carl Jahn on 07.01.15.
//  Copyright (c) 2015 Carl Jahn. All rights reserved.
//

#import "ViewController.h"
#import "CJAHandlerManager.h"
#import "CJAExamplePropertyHandler.h"

@interface ViewController ()

@property (nonatomic, strong) CJAHandlerManager *manager;
@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Example Property Handler" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 10, 100, 100);
    [self.view addSubview:button];
    
    self.button = button;
    
    NSArray *handlers = @[
                          [CJAExamplePropertyHandler new]
                          ];
    
    self.manager = [[CJAHandlerManager alloc] initWithHandlers:handlers];
    [self.manager registerSourceObjects:@[self]];
}


@end
