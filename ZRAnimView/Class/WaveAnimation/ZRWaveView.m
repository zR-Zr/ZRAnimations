//
//  ZRWaveView.m
//  ZRAnimView
//
//  Created by zR on 2016/11/14.
//  Copyright © 2016年 zR. All rights reserved.
//

#import "ZRWaveView.h"

#define Width self.bounds.size.width
#define Height self.bounds.size.height
#define WaveHeight  5.0f
#define Speed  10.0f
#define HEXColor(n) [UIColor colorWithRed:(n>>16&0xFF)/255.0f green:(n>>8&0xFF)/255.0f blue:(n&0xFF)/255.0f alpha:1.0f]

@implementation ZRWaveView
{
    CAShapeLayer * _layer1;
    CAShapeLayer * _layer2;
    
    CGFloat _offset;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
    
        [self setLayersAndPropertys];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder]){
    
        [self setLayersAndPropertys];
    }
    
    return self;
}

- (void)setLayersAndPropertys
{
    _offset = 0.0f;
    _progress = 0.0f;
    
    _layer1 = [CAShapeLayer layer];
    _layer1.frame = self.bounds;
    _layer1.strokeColor = [UIColor clearColor].CGColor;
    _layer1.fillColor = HEXColor(0x33a3dc).CGColor;
    _layer1.opacity = 0.5;
    
    
    _layer2 = [CAShapeLayer layer];
    _layer2.frame = self.bounds;
    _layer2.strokeColor = [UIColor clearColor].CGColor;
    _layer2.fillColor = HEXColor(0x009ad6).CGColor;
    _layer2.opacity = 0.5;
    
    
    [self.layer addSublayer:_layer1];
    [self.layer addSublayer:_layer2];
    
}


- (void)startAnima
{
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setPath)];
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)setPath
{
    _offset += Speed;
    
    UIBezierPath * path1 = [UIBezierPath bezierPath];
    CGFloat startY = WaveHeight * sinf(_offset * M_PI/Width) + Height/2;
    [path1 moveToPoint:CGPointMake(0, startY)];
    
    for(CGFloat i = 0.0; i < Width;i++){
        
        CGFloat y = WaveHeight * sinf(M_PI *2 * 1.5 *i /Width + _offset *M_PI /Width) + Height/2;
        
        [path1 addLineToPoint:CGPointMake(i, y)];
    }
    
    [path1 addLineToPoint:CGPointMake(Width, Height/2 +10)];
    [path1 addLineToPoint:CGPointMake(0, Height/2 + 10)];
    _layer1.path = path1.CGPath;
    
    UIBezierPath * path2 = [UIBezierPath bezierPath];
    CGFloat startY2 = WaveHeight * sinf(_offset * M_PI *2 /WaveHeight);
    [path2 moveToPoint:CGPointMake(0, startY2)];
    
    for(CGFloat i = 0.0f; i < Width; i++){
        
        CGFloat y = WaveHeight * sinf(M_PI*2 *2.0 *i /Width + _offset *2*M_PI/Width) +Height/2;
        
        [path2 addLineToPoint:CGPointMake(i, y)];
    }
    
    [path2 addLineToPoint:CGPointMake(Width, Height/2 + 10)];
    [path2 addLineToPoint:CGPointMake(0, Height/2 + 10)];
    
    _layer2.path =path2.CGPath;
    
}


- (void)startAutoProgressAnima
{
    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setPathAutoProgress)];
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}



- (void)setPathAutoProgress
{
    _progress = _progress >= 1? 0:_progress+0.01;
    [self setPathWithProgress];
}


- (void)startProgressAnima
{
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setPathWithProgress)];
    
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)setPathWithProgress
{
    _offset += Speed;
    
    

    UIBezierPath * path1 = [UIBezierPath bezierPath];
    CGFloat startY = WaveHeight * sinf(_offset *M_PI/Width) + Height - _progress *Height;
    [path1 moveToPoint:CGPointMake(0, startY)];
    
    for(CGFloat i = 0.0f; i < Width; i++){
        
        CGFloat y = WaveHeight * sinf(M_PI *2 * 1.5 *i/Width + _offset *M_PI/Width) +Height -_progress*Height;
        [path1 addLineToPoint:CGPointMake(i, y)];
    }
    
    [path1 addLineToPoint:CGPointMake(Width, Height)];
    [path1 addLineToPoint:CGPointMake(0, Height)];
    _layer1.path = path1.CGPath;
    
    
    UIBezierPath * path2 = [UIBezierPath bezierPath];
    
    CGFloat startY2 = WaveHeight * sinf(_offset * 2 * M_PI /Width) + Height - _progress*Height;
    [path2 moveToPoint:CGPointMake(0, startY)];
    
    for(CGFloat i = 0.0f; i < Width;i++){
        CGFloat y = WaveHeight * sinf(M_PI*2*2*i/Width + _offset * M_PI *2 /Width) + Height - _progress*Height;
        [path2 addLineToPoint:CGPointMake(i, y)];
    }
    
    [path2 addLineToPoint:CGPointMake(Width, Height)];
    [path2 addLineToPoint:CGPointMake(0, Height)];
    _layer2.path = path2.CGPath;
}


@end
