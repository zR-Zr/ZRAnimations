//
//  ZRWaveView.h
//  ZRAnimView
//
//  Created by zR on 2016/11/14.
//  Copyright © 2016年 zR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRWaveView : UIView

@property (nonatomic, assign)CGFloat progress;

- (void)startAnima;
- (void)startAutoProgressAnima;

- (void)startProgressAnima;
@end
