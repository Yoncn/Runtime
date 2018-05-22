//
//  ViewController.m
//  Runtime summarize
//
//  Created by 荣琛 on 2018/5/22.
//  Copyright © 2018年 rc. All rights reserved.
//

#import "ViewController.h"
#import "RuntimeForwardingClassOne.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1、Runtime 消息转发流程
    [[RuntimeForwardingClassOne new] sendMessage];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
