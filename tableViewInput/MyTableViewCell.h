//
//  MyTableViewCell.h
//  tableViewInput
//
//  Created by 伟华 on 2017/8/14.
//  Copyright © 2017年 伟华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CellType){
 
    InputType, // 输入框类型
    ButtonType,// 按钮选类型
};

@interface MyTableViewCell : UITableViewCell

@property(nonatomic,copy)void(^inputBlock)(NSString *inputStr);

@property(nonatomic,copy)void(^btnBlock)(NSArray *btnArray);

@property(nonatomic,copy)NSString *str;

@property(nonatomic,strong)NSArray *arr;

@property(nonatomic,assign)CellType cellType;

@end
