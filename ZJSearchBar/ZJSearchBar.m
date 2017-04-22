//
//  ZJSearchBar.m
//  ZJSearchBar
//
//  Created by 张建 on 2017/4/22.
//  Copyright © 2017年 张建. All rights reserved.
//

#import "ZJSearchBar.h"

@implementation ZJSearchBar

//设置输入框
- (UITextField *)searchBarTF{
    
    //获取输入框
    _searchBarTF = [self valueForKey:@"searchField"];
    
    return _searchBarTF;
}

//设置输入框中的光标的颜色，可以自定义的哦
- (void)setCursorColor:(UIColor *)cursorColor{
    
    if (cursorColor) {
        _cursorColor = cursorColor;
        //1.获取输入框
        UITextField *searchField = self.searchBarTF;
        if (searchField) {
            //2.光标颜色
            [searchField setTintColor:cursorColor];
        }
    }
    
}

//设置清除按钮的图标
- (void)setClearButtonImage:(UIImage *)clearButtonImage{
    
    if (clearButtonImage) {
        _clearButtonImage = clearButtonImage;
        //1.获取输入框
        UITextField *searchField = self.searchBarTF;
        if (searchField) {
            //清除按钮的图片
            UIButton *button = [searchField valueForKey:@"_clearButton"];
            [button setImage:clearButtonImage forState:UIControlStateNormal];
            searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
        }
    }

}

//隐藏背景图
- (void)setHideSearchBarBackgroundImage:(BOOL)hideSearchBarBackgroundImage{
    
    if (hideSearchBarBackgroundImage) {
        _hideSearchBarBackgroundImage = hideSearchBarBackgroundImage;
        self.backgroundImage = [[UIImage alloc]init];
    }
    
}

//获取取消的按钮
- (UIButton *)cancleButton{
    
    self.showsCancelButton = YES;
    for (UIView *view in [[self.subviews lastObject]subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            _cancleButton = (UIButton *)view;
        }
    }
    return _cancleButton;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        self.hasCentredPlaceholder = YES;
    }
    return self;
}

//设置搜索框中搜索🔍和提示文字的位置  （居左）
- (void)setHasCentredPlaceholder:(BOOL)hasCentredPlaceholder
{
    _hasCentredPlaceholder = hasCentredPlaceholder;
    
    SEL centerSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"setCenter", @"Placeholder:"]);
    if ([self respondsToSelector:centerSelector])
    {
        NSMethodSignature *signature = [[UISearchBar class] instanceMethodSignatureForSelector:centerSelector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:centerSelector];
        [invocation setArgument:&_hasCentredPlaceholder atIndex:2];
        [invocation invoke];
    }
}

@end
