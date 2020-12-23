//
//  JXAddBankCardAndAlipayVC.m
//  shiku_im
//
//  Created by aaa on 2019/12/29.
//  Copyright © 2019 Reese. All rights reserved.
//

#import "JXAddBankCardAndAlipayVC.h"


#import "JXAddBankCardViewController.h"


@interface JXAddBankCardAndAlipayVC ()

@end

@implementation JXAddBankCardAndAlipayVC

- (instancetype)init{
    
    self = [super init];
    if (self) {
        //self.view.frame = CGRectMake(JX_SCREEN_WIDTH, 0, JX_SCREEN_WIDTH, JX_SCREEN_HEIGHT);
        self.heightHeader = JX_SCREEN_TOP;
        self.heightFooter = 0;
        self.isGotoBack = YES;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self createHeadAndFoot];

    self.heightHeader = JX_SCREEN_TOP;
    self.heightFooter = 0;
    self.isGotoBack = YES;
    self.title = @"添加银行卡";
    
    [self addBankCrad];
    
}

- (void)addBankCrad{
    
    UIButton *addAccountButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addAccountButton setTitle:@"添加账号" forState:UIControlStateNormal];
    addAccountButton.layer.cornerRadius = 10;
    addAccountButton.layer.masksToBounds = YES;
    addAccountButton.titleLabel.font = [UIFont systemFontOfSize:19];
    addAccountButton.frame = CGRectMake(10, 10, JX_SCREEN_WIDTH - 20, 56);
    addAccountButton.layer.borderColor = THEMECOLOR.CGColor;
    addAccountButton.layer.borderWidth = 1;
    [addAccountButton setTitleColor:THEMECOLOR forState:UIControlStateNormal];
    [addAccountButton addTarget:self action:@selector(addBankCardAction) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:addAccountButton];
}

- (void)addBankCardAction {
    
    JXAddBankCardViewController * addBankCardVC = [[JXAddBankCardViewController alloc] init];
    [g_navigation pushViewController:addBankCardVC animated:YES];
}

@end
