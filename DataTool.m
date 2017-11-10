//
//  DataTool.m
//  CheMi
//
//  Created by 骆凡 on 17/3/31.
//  Copyright © 2017年 user. All rights reserved.
//

#import "DataTool.h"

@implementation DataTool

+ (instancetype)shareDataTool{
    static DataTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if (!tool) {
            tool = [[self alloc] init];
        }
    });
    return tool;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.requestSerializer.timeoutInterval = 30.0f;

    }
    return self;
}
@end
