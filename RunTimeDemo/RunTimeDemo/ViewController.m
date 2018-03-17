//
//  ViewController.m
//  RunTimeDemo
//
//  Created by 李文良 on 2018/2/27.
//  Copyright © 2018年 李文良. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "RunTime.h"
#import "NYCarGroup.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *person1 = [[Person alloc] init];
    person1.name = @"jim";
    person1.age = @"13";
    
    Person *person2 = [[Person alloc] init];
    person2.name = @"liwenliang";
    person2.age = @"15";
    
    NSMutableArray *mutiArray1 = [NSMutableArray arrayWithCapacity:0];
    [mutiArray1 addObject:person1];
    [mutiArray1 addObject:person2];
 
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"person.archiever"];
    
    [NSKeyedArchiver archiveRootObject:mutiArray1 toFile:filePath];
    NSLog(@"++++++filepath:%@",filePath);
    
    
    NSMutableArray *mutiArray2 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"+++++++%@",[[mutiArray1 lastObject] valueForKey:@"name"]);
    
    
    NSArray *carsArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil]];
    NSArray *carsDataArray = [NYCarGroup ObjectArrayWithKeyValuesArray:carsArray];
    NSLog(@"carGroupTitle:%@",[carsDataArray valueForKeyPath:@"cars.name"]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
