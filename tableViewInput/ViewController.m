//
//  ViewController.m
//  tableViewInput
//
//  Created by 伟华 on 2017/8/14.
//  Copyright © 2017年 伟华. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableDictionary *dataDic;

@end

static NSString *identy = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
 
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 375, 647) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:identy];
    }
    
    return _tableView;
}

- (NSMutableDictionary *)dataDic{
 
    if (_dataDic == nil) {
        
        _dataDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"",@"firstStr",@"",@"secStr",@"",@"thirdStr",@[@0,@0],@"fourthBtn",nil];
    }
    
    return _dataDic;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
// row数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}

// 创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    __weak typeof(self)weakSelf = self;
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    cell.inputBlock = ^(NSString *inputStr){
        if (indexPath.row == 0) {
            [weakSelf.dataDic setValue:inputStr forKey:@"firstStr"];
        }
        else if (indexPath.row == 1){
            [weakSelf.dataDic setValue:inputStr forKey:@"secStr"];
        }
        else if (indexPath.row == 2){
            [weakSelf.dataDic setValue:inputStr forKey:@"thirdStr"];
        }
        else if (indexPath.row == 3){
            
        }
        else{
            
        }
    };
    
    cell.btnBlock = ^(NSArray *btnArray) {
        [weakSelf.dataDic setValue:btnArray forKey:@"fourthBtn"];
    };
 
    if (indexPath.row == 0) {
        cell.cellType = InputType;
        cell.str = self.dataDic[@"firstStr"];
    }
    else if (indexPath.row == 1){
        cell.cellType = InputType;
        cell.str = self.dataDic[@"secStr"];
    }
    else if (indexPath.row == 2){
        cell.cellType = InputType;
        cell.str = self.dataDic[@"thirdStr"];
    }
    else if (indexPath.row == 3){
        cell.cellType = ButtonType;
        cell.arr = self.dataDic[@"fourthBtn"];
    }
    else{
        cell.cellType = InputType;
        cell.str = nil;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
