//
//  ZRTableViewController.m
//  ZRAnimView
//
//  Created by zR on 2016/11/14.
//  Copyright © 2016年 zR. All rights reserved.
//

#import "ZRTableViewController.h"
#import "ZRWaveController.h"
@interface ZRTableViewController ()

@property (nonatomic, strong) NSArray * datalists;
@end

@implementation ZRTableViewController


- (NSArray *)datalists
{
    if(!_datalists){
        
        _datalists = @[@"波纹动画"];
    }
    
    return _datalists;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.datalists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if(!cell){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.datalists[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        
        ZRWaveController * waveVC = [[ZRWaveController alloc] init];
        CABasicAnimation * animation = [CABasicAnimation animation];
        animation.keyPath = @"transform.scale";
        animation.fromValue = @0;
        animation.toValue = @1;
        animation.duration = 0.3;
        [self.navigationController pushViewController:waveVC animated:NO];
        
        [self.navigationController.view.layer addAnimation:animation forKey:nil];
       
        
    }
}


@end
