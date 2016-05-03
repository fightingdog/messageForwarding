//
//  ViewController.m
//  MessageForwarding
//
//  Created by liuzhao on 16/5/2.
//  Copyright © 2016年 liuzhao. All rights reserved.
//

#import "ViewController.h"
#import "LZHAutoDictionary.h"
#import "Teacher.h"
#import "Doctor.h"
#import "Teacher+DoctorMethod.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LZHAutoDictionary *dict = [LZHAutoDictionary new];
    dict.date = [NSDate dateWithTimeIntervalSince1970:3452345234];
    NSLog(@"dict.date = %@", dict.date);
    
    Teacher *teacher = [[Teacher alloc] init];
    [teacher operate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
