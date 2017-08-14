//
//  MyTableViewCell.m
//  tableViewInput
//
//  Created by 伟华 on 2017/8/14.
//  Copyright © 2017年 伟华. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell ()

@property(nonatomic,strong)UITextField *inputTf;

@property(nonatomic,strong)UIButton *leftBtn;

@property(nonatomic,strong)UIButton *rightBtn;

@end

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
        self.inputTf = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
        self.inputTf.backgroundColor = [UIColor orangeColor];
        [self.inputTf addTarget:self action:@selector(inputTfAction:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:self.inputTf];
        
        self.leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 10, 100, 30)];
        self.leftBtn.backgroundColor = [UIColor orangeColor];
        [self.leftBtn setTitle:@"左侧按钮" forState:UIControlStateNormal];
        [self.leftBtn setTitle:@"我被选中" forState:UIControlStateSelected];
        [self.leftBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.leftBtn];
        
        self.rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(180, 10, 100, 30)];
        self.rightBtn.backgroundColor = [UIColor orangeColor];
        [self.rightBtn setTitle:@"右侧按钮" forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"我被选中" forState:UIControlStateSelected];
        [self.rightBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rightBtn];
        
        // 默认为输入框状态
        self.cellType = InputType;
    }
    
    return self;
}

- (void)inputTfAction:(UITextField *)tf{
 
    if (self.inputBlock) {
        
        self.inputBlock(tf.text);
    }
}

- (void)btnAction:(UIButton *)btn{

    NSArray *arr = @[@0,@0];
    if ([btn isEqual:self.leftBtn]) {
        self.rightBtn.selected = NO;
        self.leftBtn.selected = YES;
        arr = @[@1,@0];
    }
    else{
        self.rightBtn.selected = YES;
        self.leftBtn.selected = NO;
        arr = @[@0,@1];
    }
    
    if (self.btnBlock) {
        self.btnBlock(arr);
    }
}

- (void)setStr:(NSString *)str{
 
    _str = str;
    
    self.inputTf.text = _str;
}


- (void)setArr:(NSArray *)arr{
 
    _arr = arr;
    
    self.leftBtn.selected = [[arr firstObject] boolValue];
    self.rightBtn.selected = [[arr lastObject] boolValue];
}


- (void)setCellType:(CellType)cellType{

   _cellType = cellType;
   
    if (_cellType == InputType) {
    
        self.inputTf.hidden = NO;
        self.leftBtn.hidden = YES;
        self.rightBtn.hidden = YES;
    }
    else{
    
        self.inputTf.hidden = YES;
        self.leftBtn.hidden = NO;
        self.rightBtn.hidden = NO;
    }
    
}

- (void)layoutSubviews{
 
    [super layoutSubviews];
}

@end
