//
//  ViewController.m
//  GetInfoDemo
//
//  Created by 徐志成 on 2017/11/2.
//  Copyright © 2017年 徐志成. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *error;
    NSString *resource = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"txt"];
    NSData *resourceData = [NSData dataWithContentsOfFile:resource];
    NSString *filePath = [self getPath:@"test.txt"];
    BOOL isSave = [resourceData writeToFile:filePath atomically:YES];
    if(isSave)
    {
        NSLog(@"is ok");
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:filePath])
    {
        NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        if (error)
        {
            NSLog(@"====%@",error.localizedDescription);
        }
        NSLog(@"%@",content);
    }

    // Do any additional setup after loading the view, typically from a nib.
}

- (NSString *)getPath:(NSString *)path
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:path];
    return filePath;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
