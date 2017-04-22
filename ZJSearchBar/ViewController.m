//
//  ViewController.m
//  ZJSearchBar
//
//  Created by 张建 on 2017/4/22.
//  Copyright © 2017年 张建. All rights reserved.
//

#import "ViewController.h"
#import "ZJSearchBar.h"
@interface ViewController ()<UISearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;

    self.title = @"自定义搜索框";
    
    [self addSearchBar];
}

- (void)addSearchBar{
    
    ZJSearchBar *searchBar = [[ZJSearchBar alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50)];
    searchBar.delegate = self;
    searchBar.backgroundColor = [UIColor colorWithRed:193.0/255.0 green:250.0/255.0 blue:223.0/255.0 alpha:1.0];
    searchBar.placeholder = @"搜索人员";
    searchBar.cursorColor = [UIColor blueColor];
    searchBar.hasCentredPlaceholder = NO;
    //清除按钮图标
    searchBar.clearButtonImage = [UIImage imageNamed:@"demand_delete"];
    
    searchBar.searchBarTF.layer.cornerRadius = 4;
    searchBar.searchBarTF.layer.masksToBounds = YES;
    searchBar.searchBarTF.layer.borderColor = [UIColor blackColor].CGColor;
    searchBar.searchBarTF.layer.borderWidth = 1.0;
//    [searchBar.searchBarTF setLeftViewMode:UITextFieldViewModeNever];
    searchBar.hideSearchBarBackgroundImage = YES;
//    searchBar.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:searchBar];

}

#pragma mark - UISearchBar Delegate

//已经开始编辑时的回调
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    ZJSearchBar *search = (ZJSearchBar *)searchBar;
    //取消按钮
    search.cancleButton.backgroundColor = [UIColor clearColor];
    [search.cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [search.cancleButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    search.cancleButton.titleLabel.font = [UIFont systemFontOfSize:14];
}

//编辑文字改变的回调
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"searchText:%@",searchText);
}

//搜索按钮
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
}

//取消按钮点击的回调
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = NO;
    searchBar.text = nil;
    [self.view endEditing:YES];
}


@end
