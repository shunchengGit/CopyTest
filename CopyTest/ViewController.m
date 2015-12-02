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

//String
@property (nonatomic, copy) NSString *cpStr;
@property (nonatomic, strong) NSString *stStr;

//Mut String
@property (nonatomic, copy) NSMutableString *cpMutStr;
@property (nonatomic, strong) NSMutableString *stMutStr;

//Array
@property (nonatomic, copy) NSArray *cpAry;
@property (nonatomic, strong) NSArray *stAry;

//Mut Array
@property (nonatomic, copy) NSMutableArray *cpMutAry;
@property (nonatomic, strong) NSMutableArray *stMutAry;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self stringTest];
    [self arrayTest];
}

#pragma mark String

- (void)stringTest
{
    [self stringCopyTest];
    [self mutableStringCopyTest];
    [self stringPropertyTest];
    [self mutableStringPropertyTest];
}

- (void)stringCopyTest
{
    LOG_METHOD_NAME
    NSString *str = @"Hello";
    LOG_OBJ_ADDRESS(str);
    NSString *cpStr = [str copy];
    LOG_OBJ_ADDRESS(cpStr);
    NSMutableString *mutCpStr = [str mutableCopy];
    LOG_OBJ_ADDRESS(mutCpStr);
    LOG_END
}

- (void)mutableStringCopyTest
{
    LOG_METHOD_NAME
    NSMutableString *mutStr = [@"OC" mutableCopy];
    LOG_OBJ_ADDRESS(mutStr);
    NSMutableString *cpMutStr = [mutStr copy];
    LOG_OBJ_ADDRESS(cpMutStr);
    NSMutableString *mutCpMutStr = [mutStr mutableCopy];
    LOG_OBJ_ADDRESS(mutCpMutStr);
    LOG_END
}

- (void)stringPropertyTest
{
    LOG_METHOD_NAME
    NSMutableString *mutStr = [@"123" mutableCopy];
    LOG_OBJ_ADDRESS(mutStr);
    self.cpStr = mutStr;
    LOG_OBJ_ADDRESS(self.cpStr);
    self.stStr = mutStr;
    LOG_OBJ_ADDRESS(self.stStr);
    NSLog(@"修改前");
    NSLog(@"mutStr：%@", mutStr);
    NSLog(@"copy：%@", self.cpStr);
    NSLog(@"strong：%@", self.stStr);
    [mutStr appendString:@"456"];
    NSLog(@"修改后");
    NSLog(@"mutStr：%@", mutStr);
    NSLog(@"copy：%@", self.cpStr);
    NSLog(@"strong：%@", self.stStr);
    LOG_END
}

- (void)mutableStringPropertyTest
{
    LOG_METHOD_NAME
    NSMutableString *mutStr = [@"123" mutableCopy];
    LOG_OBJ_ADDRESS(mutStr);
    self.cpMutStr = mutStr;
    LOG_OBJ_ADDRESS(self.cpMutStr);
    self.stMutStr = mutStr;
    LOG_OBJ_ADDRESS(self.stMutStr);
    NSLog(@"修改前");
    NSLog(@"mutStr：%@", mutStr);
    NSLog(@"copy：%@", self.cpMutStr);
    NSLog(@"strong：%@", self.stMutStr);
    [mutStr appendString:@"456"];
    NSLog(@"修改后");
    NSLog(@"mutStr：%@", mutStr);
    NSLog(@"copy：%@", self.cpMutStr);
    NSLog(@"strong：%@", self.stMutStr);
//  [self.cpMutStr appendString:@"789"]; crash
    LOG_END
}

#pragma mark Array

- (void)arrayTest
{
    [self arrayCopyTest];
    [self mutableArrayCopyTest];
    [self aryPropertyTest];
    [self mutableAryPropertyTest];
}

- (void)arrayCopyTest
{
    LOG_METHOD_NAME
    NSArray *ary = @[@1, @2, @3];
    LOG_OBJ_ADDRESS(ary);
    NSArray *cpAry = [ary copy];
    LOG_OBJ_ADDRESS(cpAry);
    NSMutableArray *mutCpAry = [ary mutableCopy];
    LOG_OBJ_ADDRESS(mutCpAry);
    LOG_END
}

- (void)mutableArrayCopyTest
{
    LOG_METHOD_NAME
    NSMutableArray *mutAry = [@[@1, @2, @3] mutableCopy];
    LOG_OBJ_ADDRESS(mutAry);
    NSArray *cpMutAry = [mutAry copy];
    LOG_OBJ_ADDRESS(cpMutAry);
    NSMutableArray *mutCpMutAry = [mutAry mutableCopy];
    LOG_OBJ_ADDRESS(mutCpMutAry);
    LOG_END
}

- (void)aryPropertyTest
{
    LOG_METHOD_NAME
    NSMutableArray *mutAry = [@[@1, @2, @3] mutableCopy];
    LOG_OBJ_ADDRESS(mutAry);
    self.cpAry = mutAry;
    LOG_OBJ_ADDRESS(self.cpAry);
    self.stAry = mutAry;
    LOG_OBJ_ADDRESS(self.stAry);
    NSLog(@"修改前");
    NSLog(@"mutAry：%@", mutAry);
    NSLog(@"copy：%@", self.cpAry);
    NSLog(@"strong：%@", self.stAry);
    [mutAry addObjectsFromArray:@[@4, @5, @6]];
    NSLog(@"修改后");
    NSLog(@"mutAry：%@", mutAry);
    NSLog(@"copy：%@", self.cpAry);
    NSLog(@"strong：%@", self.stAry);
    LOG_END
}

- (void)mutableAryPropertyTest
{
    LOG_METHOD_NAME
    NSMutableArray *mutAry = [@[@1, @2, @3] mutableCopy];
    LOG_OBJ_ADDRESS(mutAry);
    self.cpMutAry = mutAry;
    LOG_OBJ_ADDRESS(self.cpMutAry);
    self.stMutAry = mutAry;
    LOG_OBJ_ADDRESS(self.stMutAry);
    NSLog(@"修改前");
    NSLog(@"mutAry：%@", mutAry);
    NSLog(@"copy：%@", self.cpMutAry);
    NSLog(@"strong：%@", self.stMutAry);
    [mutAry addObjectsFromArray:@[@4, @5, @6]];
    NSLog(@"修改后");
    NSLog(@"mutAry：%@", mutAry);
    NSLog(@"copy：%@", self.cpMutAry);
    NSLog(@"strong：%@", self.stMutAry);
//  self.cpMutAry addObject:@1]; crash
    LOG_END
}


@end
