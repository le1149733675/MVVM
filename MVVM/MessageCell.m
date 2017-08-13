//
//  MessageCell.m
//  MVVM
//
//  Created by 趙乐樂 on 2017/8/8.
//  Copyright © 2017年 趙乐樂. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _timeLabel = [UILabel new];
        _timeLabel.frame = CGRectMake(12.5, 10, 180, 20);
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.textColor = [UIColor colorWithRed:0.61 green:0.61 blue:0.61 alpha:1.00];
        _timeLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_timeLabel];
        
        _statusLabel = [UILabel new];
        _statusLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 132.5, 10, 120, 20);
        _statusLabel.textAlignment = NSTextAlignmentRight;
        _statusLabel.textColor = [UIColor colorWithRed:0.17 green:0.77 blue:0.38 alpha:1.00];
        _statusLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_statusLabel];
        
        _headerImageView = [UIImageView new];
        _headerImageView.frame = CGRectMake(12.5, 10, 60, 60);
        [self addSubview:_headerImageView];
        
        _titleLabel = [UILabel new];
        _titleLabel.frame = CGRectMake(80, 10, [UIScreen mainScreen].bounds.size.width - 92.5, 40);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 2;
        _titleLabel.textColor = [UIColor colorWithRed:0.40 green:0.40 blue:0.40 alpha:1.00];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_titleLabel];
        
    }
    return self;
}

- (void)setModel:(MessageModel *)model
{
    _model = model;
    NSString *str = _model.create_time;//时间戳
    NSTimeInterval time=[str doubleValue];//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    _timeLabel.text = [NSString stringWithFormat:@"%@",currentDateStr];
    _titleLabel.text = _model.content;
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
