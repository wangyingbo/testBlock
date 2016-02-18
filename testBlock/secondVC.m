//
//  secondVC.m
//  testBlock
//
//  Created by 王迎博 on 15/11/20.
//  Copyright © 2015年 王迎博. All rights reserved.
//

#import "secondVC.h"

@interface secondVC ()

@property (weak, nonatomic) IBOutlet UITextField *secondPageTF;

@end

@implementation secondVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //block测试
    void (^printBlock)() = ^(){
        printf("no number\n");
    };
    printBlock();
    printBlock(9);
    
    
    int mutiplier = 7;
    //定义名为myBlock的代码块，返回值类型为int，此为在函数内部定义block
    int (^myBlock)(int) = ^(int num){
        return num*mutiplier;
    };
    int newMutiplier = myBlock(3);//使用内部定义的myBlock
    printf("newMutiplier is %d\n",newMutiplier);
    printNumBlock(mutiplier);//使用外部定义的myBlock
}


/**
 *  block可以在函数内部定义也可在外面定义,此为在外部定义
 */
void (^printNumBlock)(int) = ^(int num){
    printf("int number is %d",num);
};



/**
 *  block传值了
 */
- (IBAction)backToFirstPage:(id)sender
{
    //把值带过去。
    if (self.secondPageBlock) {
        self.secondPageBlock(self.secondPageTF.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
