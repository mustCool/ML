//
//  ViewController.m
//  TRProject
//
//  Created by yingxin on 16/7/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
@implementation ViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title = @"世界你好";
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100.f, 300.f, 200.f, 40.f)];
    label.font = [UIFont systemFontOfSize:18.f];
    label.layer.borderWidth = 2.f;
    label.layer.borderColor = [UIColor greenColor].CGColor;
    label.backgroundColor = [UIColor purpleColor];
    label.textColor = [UIColor whiteColor];
    label.text = @"hello world!  世界,你好!";
    
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
