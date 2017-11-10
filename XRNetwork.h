//
//  Network.h
//  Auditory
//
//  Created by 骆凡 on 15/4/28.
//  Copyright (c) 2015年 骆凡. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
// 下载完数据 传递数据的Block
typedef void(^ReturnBlock) (id JSON, NSError * error);

// POST成功 返回表单数据
typedef void (^FormDataCallBlock) (id<AFMultipartFormData> formData);

@interface XRNetwork : NSObject

// 发送GET 请求 获取JSON数据
+ (void)getJSONWithBaseURL:(NSString *)URL params:(id)params returnCall:(ReturnBlock)block;

// 发送POST请求 上传JSON数据
+ (void)postJSONWithBaseURL:(NSString *)URL params:(id)params returnCall:(ReturnBlock)block;

// 发送POST请求 提交表单数据
+ (void)postFormDataWithBaseURL:(NSString *)BaseURL params:(id)params formDataBlock:(FormDataCallBlock)formBlock returnCall:(ReturnBlock)block;

@end
