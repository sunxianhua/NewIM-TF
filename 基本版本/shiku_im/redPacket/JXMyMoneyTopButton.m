//
//  JXMyMoneyTopButton.m
//  shiku_im
//
//  Created by 孙先华 on 2020/5/23.
//  Copyright © 2020 Reese. All rights reserved.
//

#import "JXMyMoneyTopButton.h"

@implementation JXMyMoneyTopButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)creatView:(NSString *)iconImageName title:(NSString *)title detailString:(NSString *)detailString {
    
    self.iconImageView = [UIImageView new];
    [self addSubview:self.iconImageView];
    self.iconImageView.image = [UIImage imageNamed:iconImageName];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10.0);
        make.width.height.mas_equalTo(40.0);
    }];
    self.iconImageView.layer.cornerRadius = 20.0;
    self.iconImageView.layer.masksToBounds = YES;
    
    
    self.theTitleLabel = [UILabel new];
    [self addSubview:self.theTitleLabel];
    self.theTitleLabel.text = title;
    self.theTitleLabel.textColor = [UIColor darkGrayColor];
    self.theTitleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.theTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15.0);
        make.height.mas_equalTo(20.0);
        make.left.equalTo(self.iconImageView.mas_right).mas_offset(5.0);
    }];
    
    
    self.detailLabel = [UILabel new];
    self.detailLabel.text = detailString;
    [self addSubview:self.detailLabel];
    self.detailLabel.textColor = [UIColor grayColor];
    self.detailLabel.font = [UIFont systemFontOfSize:12.0];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-12.0);
        make.height.mas_equalTo(20.0);
        make.left.equalTo(self.iconImageView.mas_right).mas_offset(5.0);
    }];
    
    
    
    
}




@end
