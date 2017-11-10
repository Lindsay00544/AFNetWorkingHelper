//
//  Network.m
//  Auditory
//
//  Created by 骆凡 on 15/4/28.
//  Copyright (c) 2015年 骆凡. All rights reserved.
//

/**!
 *  @brief  网络请求工具类
 *
 *  @author xu ran
 **/

#import "XRNetwork.h"
#import "DataTool.h"

@implementation XRNetwork

/**
 * @brief  下载并解析JSON数据
 *
 * @param   BaseURL 需要传入的参数 回调block
 *
 * @return  void
 */
+ (void)getJSONWithBaseURL:(NSString *)URL
                    params:(id)params
                returnCall:(ReturnBlock)block
{
    [[DataTool shareDataTool] GET:URL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block(responseObject, nil);
        }
    
   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求成功
        if (block) {
            block(nil, error);
        }
    }];
}

/**
 * @brief  提交JSON数据到服务器
 *
 * @param  BaseURL 需要上传的参数 回调的block
 *
 * @return void
 */
+ (void)postJSONWithBaseURL:(NSString *)URL
                     params:(id)params
                 returnCall:(ReturnBlock)block
{
    
    [[DataTool shareDataTool] POST:URL parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block(responseObject, nil); // 请求成功 返回JSON数据
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil, error); // 请求失败 返回error
        }
        
    }];
    }

/**
 * @brief  提交表格数据到服务器
 *
 * @param  BaseURL 需要提交的参数 表单数据 回调的block
 *
 * @return void
 */
+ (void)postFormDataWithBaseURL:(NSString *)BaseURL params:(id)params formDataBlock:(FormDataCallBlock)formBlock returnCall:(ReturnBlock)block
{
    
    [[DataTool shareDataTool] POST:BaseURL parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (formBlock) {
            formBlock(formData);
        }

    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功
        if (block) {
            block(responseObject, nil);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        // 失败
        if (block) {
            block(nil, error);
        }

    }];
}

@end
