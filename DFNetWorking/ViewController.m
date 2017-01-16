//
//  ViewController.m
//  DFNetWorking
//
//  Created by 全程恺 on 17/1/16.
//  Copyright © 2017年 全程恺. All rights reserved.
//

#import "ViewController.h"
#import "DFRequestAPI.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DFRequestModel *model = [DFRequestModel new];
    
    [DFRequestAPI requestModel:model successBlock:^(DFRequest *request, id responseObject) {
        
        NSLog(@"请求成功");
    } failureBlock:^(DFRequest *request, NSError *error) {
        
        NSLog(@"请求失败");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
