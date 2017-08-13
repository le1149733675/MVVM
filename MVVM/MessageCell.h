//
//  MessageCell.h
//  MVVM
//
//  Created by 趙乐樂 on 2017/8/8.
//  Copyright © 2017年 趙乐樂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface MessageCell : UITableViewCell

@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *statusLabel;
@property (nonatomic,strong)UIImageView *headerImageView;
@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)MessageModel *model;

@end
