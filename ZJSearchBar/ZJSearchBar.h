//
//  ZJSearchBar.h
//  ZJSearchBar
//
//  Created by 张建 on 2017/4/22.
//  Copyright © 2017年 张建. All rights reserved.
//

#import <UIKit/UIKit.h>

//自定义UISearchBar,方便项目中的使用。后续可自行进行功能添加。

@interface ZJSearchBar : UISearchBar

//搜索框
@property (nonatomic, strong)UITextField *searchBarTF;
//搜索框的背景，默认是灰色哦。系统色. 是否隐藏显示
@property (nonatomic, assign)BOOL hideSearchBarBackgroundImage;
//输入框中自定义的光标颜色
@property (nonatomic, strong)UIColor *cursorColor;
//输入框中清除按钮的图片
@property (nonatomic, strong)UIImage *clearButtonImage;
//取消按钮(当showCancleButton = YES时，才可以得到)
@property (nonatomic, strong)UIButton *cancleButton;
//设置输入框中🔍和提示文字 是否居中。（NO是不居中）
@property (nonatomic, assign, setter = setHasCentredPlaceholder:) BOOL hasCentredPlaceholder;

@end
