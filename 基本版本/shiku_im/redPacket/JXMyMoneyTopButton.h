//
//  JXMyMoneyTopButton.h
//  shiku_im
//
//  Created by 孙先华 on 2020/5/23.
//  Copyright © 2020 Reese. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXMyMoneyTopButton : UIButton

@property (strong,nonatomic)UIImageView *iconImageView;
@property (strong,nonatomic)UILabel *theTitleLabel;
@property (strong,nonatomic)UILabel *detailLabel;


- (void)creatView:(NSString *)iconImageName title:(NSString *)title detailString:(NSString *)detailString;
@end

NS_ASSUME_NONNULL_END
