//
//  Synchronization.h
//  GetInfoDemo
//
//  Created by 徐志成 on 2017/11/2.
//  Copyright © 2017年 徐志成. All rights reserved.
//

#import <Cordova/CDV.h>

@interface Synchronization : CDVPlugin

/**
 *  保存本地文件
 */
- (void)saveLocalityFile:(CDVInvokedUrlCommand *)command;
/**
 *  获取数据
 */
- (void)getFileSource:(CDVInvokedUrlCommand *)command;
/**
 *  同步数据
 */
- (void)updataFile:(CDVInvokedUrlCommand *)command;
@end
