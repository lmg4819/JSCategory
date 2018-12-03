//
//  JSViewController.m
//  JSCategory
//
//  Created by lmg4819 on 12/03/2018.
//  Copyright (c) 2018 lmg4819. All rights reserved.
//

#import "JSViewController.h"
#import <JSCategory/UIView+JSCategory.h>

@interface JSViewController ()

@end

@implementation JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.js_width, self.view.js_height)];
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
