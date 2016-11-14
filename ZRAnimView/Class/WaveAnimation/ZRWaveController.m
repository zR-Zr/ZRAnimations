//
//  ZRWaveController.m
//  ZRAnimView
//
//  Created by zR on 2016/11/14.
//  Copyright © 2016年 zR. All rights reserved.
//

#import "ZRWaveController.h"
#import "ZRWaveView.h"
@interface ZRWaveController ()
@property (nonatomic, weak) ZRWaveView * progressView;
@end

@implementation ZRWaveController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZRWaveView * wave = [[ZRWaveView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width,100 )];
    
    [self.view addSubview:wave];
    [wave startAnima];
    
    ZRWaveView * wave2 = [[ZRWaveView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 100)];
    [self.view addSubview:wave2];
    [wave2 startAutoProgressAnima];
    
    ZRWaveView * wave3 = [[ZRWaveView alloc] initWithFrame:CGRectMake(50, 350,75, 75)];
    
    wave3.layer.cornerRadius = 75/2;
    wave3.layer.masksToBounds = YES;
    wave3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:wave3];
    [wave3 startAutoProgressAnima];
    
    ZRWaveView *wave4 = [[ZRWaveView alloc] initWithFrame:CGRectMake(50, 450, 75, 75)];
    wave4.backgroundColor = [UIColor greenColor];
    wave4.layer.cornerRadius = 75/2;
    wave4.layer.masksToBounds = YES;
    [self.view addSubview:wave4];
    self.progressView = wave4;
    [wave4 startProgressAnima];
}

- (IBAction)progressValueChange:(UISlider *)sender {
    
    CGFloat progress = sender.value;
    
    self.progressView.progress = progress;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
