//
//  ViewController.m
//  RKEncryptor
//
//  Created by mac on 15/12/23.
//  Copyright © 2015年 rock. All rights reserved.
//

#import "ViewController.h"
#import "FBEncryptorAES.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField* textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2, 200, 200, 50)];
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.borderWidth = 1.0f;
    textField.textColor = [UIColor blackColor];
    [self.view addSubview:textField];
    self.textField = textField;
    
    UIButton* ecodeBt = [UIButton buttonWithType:UIButtonTypeCustom];
    ecodeBt.frame = CGRectMake(self.view.frame.size.width/2 - 100, textField.frame.origin.y + textField.frame.size.height + 10, 80, 50);
    [ecodeBt setTitle:@"加密" forState:UIControlStateNormal];
    [ecodeBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    ecodeBt.layer.borderColor = [UIColor grayColor].CGColor;
    ecodeBt.layer.borderWidth = 1.0f;
    [ecodeBt addTarget:self action:@selector(jiami:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ecodeBt];
    
    UIButton* unencodeBt = [UIButton buttonWithType:UIButtonTypeCustom];
    unencodeBt.frame = CGRectMake(self.view.frame.size.width/2+20, ecodeBt.frame.origin.y, 80, ecodeBt.frame.size.height);
    [unencodeBt setTitle:@"解密" forState:UIControlStateNormal];
    [unencodeBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    unencodeBt.layer.borderColor = [UIColor grayColor].CGColor;
    unencodeBt.layer.borderWidth = 1.0f;
    [unencodeBt addTarget:self action:@selector(unencode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:unencodeBt];
    
}

- (void)jiami:(id)sender
{
    self.textField.text = [FBEncryptorAES encryptBase64String:@"啊哈哈，测试算通过么6777866554" keyString:@"UITN25LMUQC436IM" separateLines:YES];
    NSLog(@"加密：%@",self.textField.text);
}

- (void)unencode:(id)sender
{
    self.textField.text = [FBEncryptorAES decryptBase64String:@"U3icmXvYozg58sL4m6a8L0k/Flo/iKTMjaU97/frSZ4Vl3Nyf4ACyJGrWDHipNsQ" keyString:@"UITN25LMUQC436IM"];
    NSLog(@"解密：%@",self.textField.text);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
