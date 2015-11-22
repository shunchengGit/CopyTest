//
//  ViewController.m
//  CopyTest
//
//  Created by shuncheng on 15/11/22.
//  Copyright © 2015年 shuncheng. All rights reserved.
//

#import "ViewController.h"

#define LOG_METHOD_NAME {NSLog(@"%@", NSStringFromSelector(_cmd));}
#define LOG_OBJ_ADDRESS(obj) {NSLog(@"%@ : %p",NSStringFromClass([obj class]), obj);}
#define LOG_END {NSLog(@"%@", @" ");}

@interface ViewController ()

@property (nonatomic, copy) NSString *cpStr;
@property (nonatomic, strong) NSString *stStr;
@property (nonatomic, copy) NSMutableString *cpMutStr;

@property (nonatomic, copy) NSArray *cpAry;
@property (nonatomic, strong) NSArray *stAry;
@property (nonatomic, copy) NSMutableArray *cpMutAry;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self stringCopyTest];
    [self mutableStringCopyTest];
    [self arrayCopyTest];
    [self mutableArrayCopyTest];
    
    NSMutableString *mutStr = [@"123" mutableCopy];
    [self logAddress:mutStr];
    self.cpStr = mutStr;
    [self logAddress:self.cpStr];
    self.stStr = mutStr;
    [self logAddress:self.stStr];
    
    self.cpMutStr = mutStr;
    [self logAddress:self.cpMutStr];
//    [self.cpMutStr appendString:@"123"];
    
    [mutStr appendString:@"456"];
    NSLog(@"%@", mutStr);
    NSLog(@"%@", self.cpStr);
    NSLog(@"%@", self.stStr);
    
    NSMutableArray *mutAry = [@[@1, @2, @3] mutableCopy];
    [self logAddress:mutAry];
    self.cpAry = mutAry;
    [self logAddress:self.cpAry];
    self.stAry = mutAry;
    [self logAddress:self.stAry];
    self.cpMutAry = mutAry;
    [self logAddress:self.cpMutAry];
    
    [mutAry addObject:@4];
    NSLog(@"%@", mutAry);
    NSLog(@"%@", self.cpAry);
    NSLog(@"%@", self.stAry);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)stringCopyTest
{
    LOG_METHOD_NAME
    NSString *str = @"Hello";
    [self logAddress:str];
    NSString *cpStr = [str copy];
    [self logAddress:cpStr];
    NSMutableString *mutCpStr = [str mutableCopy];
    [self logAddress:mutCpStr];
    LOG_END
}

- (void)mutableStringCopyTest
{
    LOG_METHOD_NAME
    NSMutableString *mutStr = [@"OC" mutableCopy];
    [self logAddress:mutStr];
    NSMutableString *cpMutStr = [mutStr copy];
    [self logAddress:cpMutStr];
    NSMutableString *mutCpMutStr = [mutStr mutableCopy];
    [self logAddress:mutCpMutStr];
    LOG_END
}

- (void)arrayCopyTest
{
    LOG_METHOD_NAME
    NSArray *ary = @[@1, @2, @3];
    [self logAddress:ary];
    NSArray *cpAry = [ary copy];
    [self logAddress:cpAry];
    NSMutableArray *mutCpAry = [ary mutableCopy];
    [self logAddress:mutCpAry];
    LOG_END
}

- (void)mutableArrayCopyTest
{
    LOG_METHOD_NAME
    NSMutableArray *mutAry = [@[@1, @2, @3] mutableCopy];
    [self logAddress:mutAry];
    NSArray *cpMutAry = [mutAry copy];
    [self logAddress:cpMutAry];
    NSMutableArray *mutCpMutAry = [mutAry mutableCopy];
    [self logAddress:mutCpMutAry];
    LOG_END
}

- (void)logAddress:(id)obj
{
    LOG_OBJ_ADDRESS(obj)
}


@end
