//
//  Synchronization.m
//  GetInfoDemo
//
//  Created by 徐志成 on 2017/11/2.
//  Copyright © 2017年 徐志成. All rights reserved.
//

#import "Synchronization.h"

@implementation Synchronization
- (void)saveLocalityFile:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    NSError *error;
    NSString *resource = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"txt"];
    NSData *resourceData = [NSData dataWithContentsOfFile:resource];
    NSString *filePath = [self getPath:@"test.txt"];
    BOOL isSave = [resourceData writeToFile:filePath atomically:YES];
    if(isSave)
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
    }
    else
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"error"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getFileSource:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    NSString *filePath = [self getPath:@"test.txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:filePath])
    {
        NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        if (error)
        {
            NSLog(@"====%@",error.localizedDescription);
        }
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:content];
    }
    else
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"文件不存在"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)updataFile:(CDVInvokedUrlCommand *)command
{
    
}

- (NSString *)getPath:(NSString *)path
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:path];
    return filePath;
}
@end
