//
//  ShowBtnColor.h
//  testBlock
//
//  Created by 王迎博 on 16/1/5.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Changcolor)(UIColor *colorEnum);

@interface ShowBtnColor : UIViewController

+ (void)ChangeBtnColor:(Changcolor)ChangcolorBlock;

@end
