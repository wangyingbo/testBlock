//
//  ViewController.m
//  testBlock
//
//  Created by 王迎博 on 15/11/20.
//  Copyright © 2015年 王迎博. All rights reserved.
//

#import "ViewController.h"
#import "secondVC.h"
#import "ShowBtnColor.h"

typedef void(^chargeBlock)(void);

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *FirstPageLB;
@property (weak, nonatomic) IBOutlet UIButton *testBlockBtn;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
    NSLog(@"我在玩手机");
    NSLog(@"手机没电了");
    
    /**
     *  第一步：先走到chargeMyIphone的方法里去
     *  第二步：在方法里执行GCD和 NSLog(@"电充好了");
     *  第三步：执行 finishBlock();
     *  第四步：会回调这里 NSLog(@"出去逛街");
     */
    [self chargeMyIphone:^{
        NSLog(@"出去逛街");
    }];

    NSLog(@"我在看电视");
}



/**
 *  block和GCD测试block回调
 *
 *  @param finishBlock 用此block进行回调
 */
-(void)chargeMyIphone:(chargeBlock)finishBlock
{
    double delayInSeconds = 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"电充好了");
        finishBlock();
    });
}



/**
 *  用block进行页面传值
 */
- (IBAction)turnToNextPage:(id)sender
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    secondVC *vc = [storyBoard instantiateViewControllerWithIdentifier:@"secondVC"];
    vc.secondPageBlock = ^(NSString *str){
        self.FirstPageLB.text = str;
    };
    
    [self.navigationController pushViewController:vc animated:YES];
}




/**
 *  调用ShowBtnColor里的方法。改变按钮的背景颜色。
 *  第一步：当点击按钮时，先走ShowBtnColor的类方法；
 *  第二步：在类方法里执行 UIColor *temp = [UIColor greenColor];
 *  第三步：在类方法里执行ChangcolorBlock(temp);
 *  第四步：然后回到这里 self.testBlockBtn.backgroundColor = colorEnum;
 *  @param sender
 */
- (IBAction)testBlockBtn:(UIButton *)sender
{
    
    [ShowBtnColor ChangeBtnColor:^(UIColor *colorEnum) {
        self.testBlockBtn.backgroundColor = colorEnum;
    }];
}




@end
