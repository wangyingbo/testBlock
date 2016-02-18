//
//  ShowBtnColor.m
//  testBlock
//
//  Created by 王迎博 on 16/1/5.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "ShowBtnColor.h"

@interface ShowBtnColor ()

@end

@implementation ShowBtnColor

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


+ (void)ChangeBtnColor:(Changcolor)ChangcolorBlock
{
    UIColor *temp = [UIColor greenColor];
    ChangcolorBlock(temp);
    
}

@end
