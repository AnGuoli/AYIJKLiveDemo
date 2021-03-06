//
//  PlayViewController.m
//  ijkTestDemo
//
//  Created by 国立安 on 2018/3/29.
//  Copyright © 2018年 国立安. All rights reserved.
//

#import "PlayViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface PlayViewController ()
@property (nonatomic, strong) IJKFFMoviePlayerController *playerVC;
@end

@implementation PlayViewController

// 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     * 浏览器打开 http://service.inke.com/api/live/simpleall?&gender=1
     * 复制 stream_addr 对应的直播地址 替换下面的urlStr
     */
    self.view.backgroundColor = [UIColor whiteColor];
    // 拉流 URL
    NSURL *liveURL = [NSURL URLWithString:@"http://alsource.pull.inke.cn/live/1522318652343521.flv?ikDnsOp=1&ikHost=tx&ikOp=0&codecInfo=8192&ikLog=0&dpSrcG=21&ikMinBuf=3800&ikMaxBuf=4800&ikSlowRate=1.0&ikFastRate=1.0"];
    
    IJKFFMoviePlayerController *playerVC = [[IJKFFMoviePlayerController alloc] initWithContentURL:liveURL withOptions:nil];
    
    [self.view addSubview:playerVC.view];
    
    playerVC.view.frame = self.view.frame;
    
    // 记录成员变量
    _playerVC = playerVC;
    
    [playerVC prepareToPlay];
    
    [playerVC play];
}

#pragma mark - 当离开当前直播间的时候，要停止播放
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 界面消失，一定要记得停止播放
    [_playerVC pause];
    [_playerVC stop];
    [_playerVC shutdown];
}

// 2.0-1

@end
