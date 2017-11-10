//
//  DataTool.h
//  CheMi
//
//  Created by 骆凡 on 17/3/31.
//  Copyright © 2017年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface DataTool : AFHTTPSessionManager

+ (instancetype)shareDataTool;

@end
