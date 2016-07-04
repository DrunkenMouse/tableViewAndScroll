//
//  ADTestTable.m
//  tableView嵌套无限轮播
//
//  Created by 王奥东 on 16/6/22.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ADTestTable.h"
#import "SDCycleScrollView.h"

@interface ADTestTable ()

@property(nonatomic,strong)SDCycleScrollView * cycleScrollView;
@end

@implementation ADTestTable

-(void)awakeFromNib{

    //  自动计算行高
    self.rowHeight = UITableViewAutomaticDimension;
    //  设置预估高度
    self.estimatedRowHeight = 200;
    //设置代理对象为自己，才能执行以下的显示操作
    self.delegate = self;
    self.dataSource = self;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        return 180;
    }
    else{
        return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str = @"test";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试%ld",(long)indexPath.row];
    if (indexPath.row == 2) {
        //设置无限轮播
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        
        NSArray *imageNames = @[@"h1.jpg",
                                @"h2.jpg",
                                @"h3.jpg",
                                @"h4.jpg",
                                @"h7" // 本地图片请填写全名
                                ];
        
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
        
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.cycleScrollView = cycleScrollView;
        
    
        //添加到cell的contentView上
        [cell.contentView addSubview:self.cycleScrollView];
    }

    
    return cell;
}

@end
