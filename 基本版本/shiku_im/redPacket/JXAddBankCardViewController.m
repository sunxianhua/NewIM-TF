//
//  JXAddBankCardViewController.m
//  shiku_im
//
//  Created by aaa on 2019/12/29.
//  Copyright © 2019 Reese. All rights reserved.
//

#import "JXAddBankCardViewController.h"
#import "JXPickerView.h"
#import "NSString+JXNSString.h"
#import "NSString+JXNSString.h"


@interface JXAddBankCardViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UITextField *cardholderTextField;
@property (nonatomic, strong) UITextField *bankTypeTextField;
@property (nonatomic, strong) UITextField *cardNumTextField;
@property (nonatomic, strong) UITextField *cardAddressField;

@property (nonatomic, strong) NSArray *bankTitleArray;
@property (nonatomic, strong) JXPickerView *pickerView;

@property (nonatomic, strong) UIView *selectView;


@property (strong,nonatomic) NSMutableArray <UITextField *>* textFieldArray;

@end

#define HEIGHT 56

@implementation JXAddBankCardViewController

- (instancetype)init{
    
    self = [super init];
    if (self) {
        //self.view.frame = CGRectMake(JX_SCREEN_WIDTH, 0, JX_SCREEN_WIDTH, JX_SCREEN_HEIGHT);
        self.heightHeader = JX_SCREEN_TOP;
        self.heightFooter = 0;
        self.isGotoBack = YES;
        
        self.bankTitleArray = @[@"姓名",
                                @"支付宝账号",
                                @"中国建设银行",
                                @"中国工商银行",
                                @"中国农业银行",
                                @"中国交通银行",
                                @"中国邮政储蓄"];
   
        
        
        
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    

//    self.heightHeader = 0;
    self.heightFooter = 0;
    self.isGotoBack = YES;
    [self createHeadAndFoot];
    
    self.header.hidden = YES;
    self.tableView.bounces = NO;

    
    self.title = @"绑定账号";
    
    CGFloat h = 0;
    
    
    self.textFieldArray = [NSMutableArray new];
    
    JXImageView *nameImageView = [self createButton:@"真实姓名" drawTop:YES drawBottom:YES must:NO click:nil];
    nameImageView.frame = CGRectMake(0, h, JX_SCREEN_WIDTH, HEIGHT);
    [self createTextField:nameImageView default:@"" hint:@"请输入真实姓名"];
    
    h += HEIGHT;
    
    JXImageView *cardNumView = [self createButton:@"开户银行" drawTop:YES drawBottom:YES must:NO click:nil];
    cardNumView.frame = CGRectMake(0, h, JX_SCREEN_WIDTH, HEIGHT);
    [self createTextField:cardNumView default:@"" hint:@"请输入开户银行"];
    
    h += HEIGHT;
    
    JXImageView *cardNumView1 = [self createButton:@"开户支行" drawTop:YES drawBottom:YES must:NO click:nil];
    cardNumView1.frame = CGRectMake(0, h, JX_SCREEN_WIDTH, HEIGHT);
    [self createTextField:cardNumView1 default:@"" hint:@"请输入开户支行"];
    
    h += HEIGHT;
    
    JXImageView *cardNumView2 = [self createButton:@"银行卡号" drawTop:YES drawBottom:YES must:NO click:nil];
    cardNumView2.frame = CGRectMake(0, h, JX_SCREEN_WIDTH, HEIGHT);
    [self createTextField:cardNumView2 default:@"" hint:@"请输入银行卡号"];
    _cardAddressField.keyboardType = UIKeyboardTypeNumberPad;
    h += HEIGHT;
    
    JXImageView *cardNumView3 = [self createButton:@"电话号码" drawTop:YES drawBottom:YES must:NO click:nil];
    cardNumView3.frame = CGRectMake(0, h, JX_SCREEN_WIDTH, HEIGHT);
    [self createTextField:cardNumView3 default:@"" hint:@"请输入银行预留电话号码"];
    h += HEIGHT + 30.0;
    
    
    self.textFieldArray[3].keyboardType = UIKeyboardTypeNumberPad;
    self.textFieldArray[4].keyboardType = UIKeyboardTypeNumberPad;
    
//    h += HEIGHT;
//
//    JXImageView *cardTypeView = [self createButton:@"银行类型" drawTop:YES drawBottom:YES must:NO click:nil];
//    cardTypeView.frame = CGRectMake(0, h, JX_SCREEN_WIDTH, HEIGHT);
//    _bankTypeTextField = [self createTextField:cardTypeView default:@"" hint:@"请选择银行类型"];
//
//    _selectView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 220, JX_SCREEN_WIDTH, 220)];
//    _selectView.backgroundColor = HEXCOLOR(0xf0eff4);
//    _selectView.hidden = YES;
//    [self.view addSubview:_selectView];
//
//    h += HEIGHT;
//
//    JXImageView *cardAddressView = [self createButton:@"银行开户地" drawTop:YES drawBottom:YES must:NO click:nil];
//    cardAddressView.frame = CGRectMake(0, h, JX_SCREEN_WIDTH, HEIGHT);
//    _cardAddressField = [self createTextField:cardAddressView default:@"" hint:@"请输入银行开户地"];
//
//    h += HEIGHT + 20;
    
    UIButton *bindButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bindButton.backgroundColor = THEMECOLOR;
    [bindButton setTitle:@"绑定" forState:UIControlStateNormal];
    bindButton.layer.cornerRadius = 10;
    bindButton.layer.masksToBounds = YES;
    [bindButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bindButton.frame = CGRectMake(10, h, JX_SCREEN_WIDTH - 20, HEIGHT);

    [bindButton addTarget:self action:@selector(bindAliAction) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:bindButton];
    
    
    
   //获取已绑定的账户信息
    [g_server handleAliAccontInfor:0 username:NULL bank:NULL subBank:NULL card:NULL telephone:NULL toView:self];
}

- (void)requestNetwork{
    
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
//    if(textField == _bankTypeTextField){
//
//        [self.view endEditing:YES];
//        [g_window addSubview:self.pickerView];
//        self.pickerView.hidden = NO;
//        return NO;
//    }
//    else{
//        self.pickerView.hidden = YES;
//        return YES;
//    }
    
    
    return YES;
    
}

- (JXPickerView *)pickerView{
    
    if (!_pickerView) {
        _pickerView = [JXPickerView new];
//        _pickerView.didSelect = @selector(comfirmAction);
        _pickerView.delegate = self;
        _pickerView.dataSource =self;
        [_pickerView.confirmButton addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pickerView;
}

- (void)confirmAction {
    
    //点击确定的回调
    NSInteger selectComponent = [self.pickerView.pickerView selectedRowInComponent:0];
    NSString *selectStr = self.bankTitleArray[selectComponent];
    _bankTypeTextField.text = selectStr;
    [self.pickerView removeFromSuperview];
}


- (void)bindAliAction{
    
    [self.view endEditing:true];
    
    
    if (![self.textFieldArray[0].text isName]) {
        [g_App showAlert:@"请输入真实姓名"];
        return;
    }
    
    
//    if (![self.textFieldArray[1].text isName]) {
//        [g_App showAlert:@"银行卡号有误"];
//        return;
//    }
//
//
//    if (![self.textFieldArray[2].text isName]) {
//        [g_App showAlert:@"支行输入有误"];
//        return;
//    }
    
    
    
    if (![self.textFieldArray[3].text isNumber]) {
        [g_App showAlert:@"银行卡号输入有误"];
        return;
    }
    
    
    if (![self.textFieldArray[4].text isPhoneNumber]) {
        [g_App showAlert:@"电话号码有误"];
        return;
    }

    
    [g_server handleAliAccontInfor:1 username:self.textFieldArray[0].text bank:self.textFieldArray[1].text subBank:self.textFieldArray[2].text card:self.textFieldArray[3].text telephone:self.textFieldArray[4].text toView:self];
                                                                                                                                
    
    
}

#pragma mark - pickerViewDelegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.bankTitleArray.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    
    return 40;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.bankTitleArray[row];
}

- (JXImageView*)createButton:(NSString*)title drawTop:(BOOL)drawTop drawBottom:(BOOL)drawBottom must:(BOOL)must click:(SEL)click{
    
    JXImageView* btn = [[JXImageView alloc] init];
    btn.backgroundColor = [UIColor whiteColor];
    btn.userInteractionEnabled = YES;
    if(click)
        btn.didTouch = click;
    else
        btn.didTouch = @selector(hideKeyboard);
    
    btn.delegate = self;
    [self.tableView addSubview:btn];
//    [btn release];
    
    if(must){
        UILabel* p = [[UILabel alloc] initWithFrame:CGRectMake(INSETS, 5, 20, HEIGHT-5)];
        p.text = @"*";
        p.font = g_factory.font18;
        p.backgroundColor = [UIColor clearColor];
        p.textColor = [UIColor redColor];
        p.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:p];
//        [p release];
    }
    
    JXLabel* p = [[JXLabel alloc] initWithFrame:CGRectMake(30, 0, 130, HEIGHT)];
    p.text = title;
    p.font = g_factory.font15;
    p.backgroundColor = [UIColor clearColor];
    p.textColor = [UIColor blackColor];
    [btn addSubview:p];
//    [p release];
    
    if(drawTop){
        UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0,0,JX_SCREEN_WIDTH,0.5)];
        line.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        [btn addSubview:line];
//        [line release];
    }
    
    if(drawBottom){
        UIView* line = [[UIView alloc]initWithFrame:CGRectMake(0,HEIGHT-0.5,JX_SCREEN_WIDTH,0.5)];
        line.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        [btn addSubview:line];
//        [line release];
    }
    
    if(click){
        UIImageView* iv;
        iv = [[UIImageView alloc] initWithFrame:CGRectMake(JX_SCREEN_WIDTH-INSETS-20-3, (HEIGHT - 20) / 2, 20, 20)];
        iv.image = [UIImage imageNamed:@"set_list_next"];
        [btn addSubview:iv];
//        [iv release];
    }
    return btn;
}

- (UITextField*)createTextField:(UIView*)parent default:(NSString*)s hint:(NSString*)hint{
    
    UITextField* p = [[UITextField alloc] initWithFrame:CGRectMake(JX_SCREEN_WIDTH / 2,INSETS,JX_SCREEN_WIDTH / 2, HEIGHT-INSETS * 2)];
    p.delegate = self;
    p.autocorrectionType = UITextAutocorrectionTypeNo;
    p.autocapitalizationType = UITextAutocapitalizationTypeNone;
    p.enablesReturnKeyAutomatically = YES;
    p.borderStyle = UITextBorderStyleNone;
    p.returnKeyType = UIReturnKeyDone;
    p.clearButtonMode = UITextFieldViewModeAlways;
    p.textAlignment = NSTextAlignmentRight;
    p.userInteractionEnabled = YES;
    p.text = s;
    p.placeholder = hint;
    p.font = g_factory.font15;
    [parent addSubview:p];
    
    [self.textFieldArray addObject:p];
//    [p release];
    return p;
}



- (void)didServerResultSucces:(JXConnection *)aDownload dict:(NSDictionary *)dict array:(NSArray *)array1{
    [_wait stop];
    if ([aDownload.action isEqualToString:act_getAlipayAccount]) {
        
        
        NSDictionary *dataDic = dict;
        
        if (dataDic[@"username"]) {
            self.textFieldArray[0].text = dataDic[@"username"];
        }
        
        if (dataDic[@"bank"]) {
            self.textFieldArray[1].text = dataDic[@"bank"];
        }
        
        if (dataDic[@"subBank"]) {
            self.textFieldArray[2].text = dataDic[@"subBank"];
        }
        
        if (dataDic[@"card"]) {
            self.textFieldArray[3].text = dataDic[@"card"];
        }
        
        if (dataDic[@"telephone"]) {
            self.textFieldArray[4].text = dataDic[@"telephone"];
        }
        //获取到了信息
        NSLog(@"----支付宝信息---%@",dict);
    }
    
    
    if ([aDownload.action isEqualToString:act_setAlipayAccount]) {
        
        [g_App showAlert:@"设置成功" completeBlock:^{
            [self actionQuit];
        }];
    }
}





- (int)didServerResultFailed:(JXConnection *)aDownload dict:(NSDictionary *)dict{
    [_wait stop];
    //    if ([aDownload.action isEqualToString:]) {
    //        return hide_error
    //    }
    return show_error;
}

- (int)didServerConnectError:(JXConnection *)aDownload error:(NSError *)error{
    [_wait stop];
    //    if ([aDownload.action isEqualToString:]) {
    //        [self refreshAfterConnectError];
    //    }
    return hide_error;
}

-(void) didServerConnectStart:(JXConnection*)aDownload{
    [_wait start];
}



@end
