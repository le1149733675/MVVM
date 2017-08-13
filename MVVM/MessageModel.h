//
//  MessageModel.h
//  MVVM
//
//  Created by 趙乐樂 on 2017/8/8.
//  Copyright © 2017年 趙乐樂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (nonatomic,copy)NSString *create_time;
@property (nonatomic,copy)NSString *has_read;//是否已读
@property (nonatomic,copy)NSString *message_id;
@property (nonatomic,copy)NSString *content;

@end
