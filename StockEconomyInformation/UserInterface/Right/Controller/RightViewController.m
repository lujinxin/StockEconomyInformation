//
//  RightViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/1/9.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController () {
    
    UITextView *_textView;
}

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"leftright_bg"]]];
//    self.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0 alpha:.5];
    [self createNote];
    
    
}


- (void)createNote {
//------------标题
    UILabel *noteLabe = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300 -20, 40)];
    noteLabe.text = @"备忘";
    noteLabe.textColor = [UIColor whiteColor];
    noteLabe.textAlignment = NSTextAlignmentCenter;
    noteLabe.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];
    
//------------输入框
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 64, 300 -20, 345)];
    _textView.delegate = self;
    _textView.font = [UIFont fontWithName:@"Arial" size:17.0];
    
//------------清空按钮
    UIButton *cleanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cleanButton addTarget:self action:@selector(cleanAct:) forControlEvents:UIControlEventTouchUpInside];
    
    cleanButton.frame = CGRectMake(10, 420, 300 -20, 40);
    [cleanButton setTitle:@"清空" forState:UIControlStateNormal];
    [cleanButton.titleLabel setFont:[UIFont systemFontOfSize:20.0]];
//    UIImage *imageTemp = [UIImage imageNamed:@"clean"];
//    imageTemp = [imageTemp stretchableImageWithLeftCapWidth:imageTemp.size.width*0.5 topCapHeight:imageTemp.size.width*0.5];
//    [cleanButton setBackgroundImage:imageTemp forState:UIControlStateNormal];
    cleanButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"clean"]];
    
    
//    cleanButton.backgroundColor = [UIColor yellowColor];

//    [cleanButton setBackgroundImage:[UIImage imageNamed:@"clean@2x.png"] forState:UIControlStateNormal];


    
//------------提醒
    UILabel *remindMessage = [[UILabel alloc] initWithFrame:CGRectMake(20, 480, 300 -30, 140)];
    remindMessage.textColor = [UIColor whiteColor];
    remindMessage.text = @"您可能需要记录些什么，所以，这里为您准备了一个备忘录，您可以在上方的备忘区域记录一些信息，比如需要关注的股票，或者某个消息。若要删除所有信息，请点击上方的“清空”按钮。";
    [remindMessage setNumberOfLines:0];
    
    [self.view addSubview:noteLabe];
    [self.view addSubview:_textView];
    [self.view addSubview:cleanButton];
    [self.view addSubview:remindMessage];
    
}

//----------放弃第一响应
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [self.view resignFirstResponder];
}

//----------清空按钮点击事件
- (void)cleanAct:(UIButton *)btn {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定清空吗？" delegate:self cancelButtonTitle:@"不要" otherButtonTitles:@"清空", nil];
    if (![_textView.text isEqualToString:@""]) {
        [alert show];
    } else {
        tipWithMessage(@"  没有内容！");
    }
}

//----------alertView的点击事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [_textView setText:nil];
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
