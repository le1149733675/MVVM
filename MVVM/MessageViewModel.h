//
//  MessageViewModel.h
//  MVVM
//
//  Created by 趙乐樂 on 2017/8/8.
//  Copyright © 2017年 趙乐樂. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^returnValueBlock) (id returnValue);
typedef void (^returnErrorCodeBlock) (id errorCode);

@interface MessageViewModel : NSObject

@property (nonatomic,copy)returnValueBlock returnValue;
@property (nonatomic,copy)returnErrorCodeBlock errorCode;

- (void)getData;
- (void)getMoreData:(NSInteger)page;

@end
