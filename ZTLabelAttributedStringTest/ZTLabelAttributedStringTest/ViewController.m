//
//  ViewController.m
//  ZTLabelAttributedStringTest
//
//  Created by tony on 16/8/16.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+YBAttributeTextTapAction.h"
@interface ViewController ()<YBAttributeTapActionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *labelString = @"珠海市香洲区唐家湾金堂路大洲科技园 查看地图";
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:labelString];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, labelString.length)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(labelString.length-4, 4)];
    // 创建一个文字附件对象
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:@"23660e717d933afc7dab5f6e43b36647.png"];  //设置图片源
    textAttachment.bounds = CGRectMake(0, -6, 30, 30);  //设置图片位置和大小
    // 将文字附件转换成属性字符串
    NSAttributedString *attachmentAttrStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
    // 将转换成属性字符串插入到目标字符串
    [attrStr insertAttributedString:attachmentAttrStr atIndex:labelString.length];
    UILabel *ybLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width - 20, 60)];
    ybLabel1.backgroundColor = [UIColor yellowColor];
    ybLabel1.numberOfLines = 2;
    ybLabel1.attributedText = attrStr;
    [self.view addSubview:ybLabel1];
    [ybLabel1 yb_addAttributeTapActionWithStrings:@[@"查看地图"] delegate:self];
}
- (void)yb_attributeTapReturnString:(NSString *)string range:(NSRange)range index:(NSInteger)index
{
    NSString *message = [NSString stringWithFormat:@"点击了“%@”字符\nrange: %@\nindex: %ld",string,NSStringFromRange(range),index];
    NSLog(@"%@",message);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
