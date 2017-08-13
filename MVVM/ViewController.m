//
//  ViewController.m
//  MVVM
//
//  Created by 趙乐樂 on 2017/8/8.
//  Copyright © 2017年 趙乐樂. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
#import "MessageCell.h"
#import "MessageModel.h"
#import "MessageViewModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *messageArray;//消息数组
@property (nonatomic,assign)NSInteger page;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    //    [self requestMessageData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    self.navigationItem.title = @"消息";
    
    _page = 0;
    [self tableView];
    _messageArray = [NSMutableArray new];
    MessageViewModel *viewModel = [[MessageViewModel alloc]init];
    viewModel.returnValue = ^(id returnValue){
        _messageArray = returnValue;
        
        [_tableView reloadData];
    };
    viewModel.errorCode = ^(id errorCode){
        
    };
    [viewModel getData];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark======刷新数据
- (void)loadNewData
{
    [self.tableView.mj_header endRefreshing];
}
- (void)loadMoreData
{
    [self.tableView.mj_footer endRefreshing];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    HSBMessageModel *message = _messageArray[indexPath.section];
    static NSString *cellID = @"cell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.model = _messageArray[indexPath.section];
    
    if (indexPath.row == 0) {
        cell.timeLabel.hidden = NO;
        cell.headerImageView.hidden = YES;
        cell.titleLabel.hidden = YES;
    }else{
        cell.timeLabel.hidden = YES;
        cell.headerImageView.hidden = NO;
        cell.titleLabel.hidden = NO;
        cell.headerImageView.image = [UIImage imageNamed:@"Message_Placehold"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        [self showAlert:@"别点了，疼"];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 20;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 40;
    }
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _messageArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (void)showAlert:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
