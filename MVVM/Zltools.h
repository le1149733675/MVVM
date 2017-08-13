//
//  Zltools.h
//  MVVM
//
//  Created by 趙乐樂 on 2017/8/8.
//  Copyright © 2017年 趙乐樂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Zltools : NSObject

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

@end
