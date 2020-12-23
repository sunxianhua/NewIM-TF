//
//  LoginDelegateVC.m
//  shiku_im
//
//  Created by 孙先华 on 2020/5/13.
//  Copyright © 2020 Reese. All rights reserved.
//

#import "LoginDelegateVC.h"

@interface LoginDelegateVC ()

@end

@implementation LoginDelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.heightHeader = JX_SCREEN_TOP;
    self.heightFooter = 0;
    
    self.title = @"用户协议";
    //        self.view.frame = g_window.bounds;
    self.isGotoBack = YES;
    [self createHeadAndFoot];
    
    
    UITextView *textView = [UITextView new];
    [self.tableBody addSubview:textView];
    textView.frame = CGRectMake(15.0, 20.0, JX_SCREEN_WIDTH-30.0, 450.0);
    textView.textColor = UIColor.blackColor;
    textView.font = [UIFont systemFontOfSize:15.0];
    textView.text = @"1您注册成功后，即成为本APP平台的会员，将持有本APP平台唯一编号的账户信息，您可以根据本站规定改变您的密码。\n2您设置的姓名为真实姓名，不得侵犯或涉嫌侵犯他人合法权益。否则，本APP有权终止向您提供服务，注销您的账户。账户注销后，相应的会员名将开放给任意用户注册登记使用。\n3您应谨慎合理的保存、使用您的会员名和密码，应对通过您的会员名和密码实施的行为负责。除非有法律规定或司法裁定，且征得本APP的同意，否则，会员名和密码不得以任何方式转让、赠与或继承（与账户相关的财产权益除外）。\n4用户不得将在本站注册获得的账户借给他人使用，否则用户应承担由此产生的全部责任，并与实际使用人承担连带责任。\n5如果发现任何非法使用等可能危及您的账户安全的情形时，您应当立即以有效方式通知本APP要求暂停相关服务，并向公安机关报案。您理解本APP对您的请求采取行动需要合理时间，本APP对在采取行动前已经产生的后果（包括但不限于您的任何损失）不承担任何责任。";
    
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
