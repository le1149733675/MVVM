//
//  MessageViewModel.m
//  MVVM
//
//  Created by 趙乐樂 on 2017/8/8.
//  Copyright © 2017年 趙乐樂. All rights reserved.
//

#import "MessageViewModel.h"
#import "MessageModel.h"
#import "Zltools.h"

@implementation MessageViewModel

- (void)getData
{
    NSString *url = @"https://api.nb82.com/Recovery/Index/get_message_list";
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:5];
    
    dic[@"user_id"] = @"3658";
    dic[@"user_type_id"] = @"10";
    dic[@"page_num"] = @0;
    dic[@"limit"] = @10;
    dic[@"data_source"] = @2;
    
    /*注意：1,公司对传递的参数有加密算法，因加密算法为公司机密，此demo中并未体现
           2,实际运用中对解析出来的数据有多种操作，此demo中仅作为MVVM示例，并未对数据进行优化操作
     */
    NSMutableDictionary *jsonParams = [NSMutableDictionary dictionaryWithCapacity:2];
    jsonParams[@"jsonStr"] = [self dictionaryToJson:dic];
    jsonParams[@"token"] = @"a7a72a2454868c340ec7680f24e9ee9c47979";
//    NSLog(@"获得消息的jsonParams ======== %@",jsonParams);
    [Zltools post:url params:jsonParams success:^(id json) {
//        NSLog(@"获得消息的json ======== %@",json);
        NSDictionary *dict = json;
        NSMutableArray *array = dict[@"respond"];
        NSMutableArray *subjectArray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *subject in array) {
            MessageModel *model = [[MessageModel alloc]init];
            model.message_id = subject[@"id"];
            model.create_time = subject[@"create_time"];
            model.content = subject[@"content"];
            model.has_read = subject[@"has_read"];
            [subjectArray addObject:model];
        }
        _returnValue(subjectArray);
        
    } failure:^(NSError *error) {
        _errorCode(error);
    }];
}

- (NSString *)dictionaryToJson:(NSMutableDictionary *)dic{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:nil error:&parseError];
    return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
