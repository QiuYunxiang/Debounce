//
//  ViewController.m
//  Debounce
//
//  Created by qiu on 2019/5/5.
//  Copyright © 2019年 qiu. All rights reserved.
//

#import "ViewController.h"
#import "DebounceFunctionManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    DebounceFunctionManager *deFucM = [[DebounceFunctionManager alloc] init];
    
    for (int i = 0; i < 9999; i++) {
        [deFucM debounceTarget:self function:@selector(test_1:) userInfo:[NSString stringWithFormat:@"第%d次",i] interval:1];
    }
    
    
    for (int j = 0; j < 12340; j++) {
        [deFucM debounceTarget:self function:@selector(test_2:) userInfo:@"第二个任务" interval:1];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)test_1:(id)message {
    NSLog(@"%@",message);
}

- (void)test_2:(id)message {
    NSLog(@"%@",message);
}


@end
