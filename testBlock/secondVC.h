//
//  secondVC.h
//  testBlock
//
//  Created by 王迎博 on 15/11/20.
//  Copyright © 2015年 王迎博. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef int(^thisBlock)(NSString *testStr);//int是返回类型，thisBlock是名字，testStr是NSString类型的参数


@interface secondVC : UIViewController

@property (nonatomic,weak)thisBlock block;
@property (nonatomic,copy)void(^secondPageBlock)(NSString *deliverStr);//传值

@end
