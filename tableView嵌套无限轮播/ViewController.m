//
//  ViewController.m
//  tableView嵌套无限轮播
//
//  Created by 王奥东 on 16/6/22.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"
#import "ADTestTable.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ADTestTable *table = [[ADTestTable alloc]init];
    table.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400);

    [table awakeFromNib];
    
    
    [self.view addSubview:table];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
