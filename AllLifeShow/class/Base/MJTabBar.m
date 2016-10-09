//
//  MJTabBar.m
//  AllLifeShow
//
//  Created by 邓茂江 on 16/10/8.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJTabBar.h"
@interface MJTabBar()
@property(nonatomic,strong)UIImageView *tabImagebgView;
@property(nonatomic,strong)NSArray *dataList;
@end

@implementation MJTabBar

-(UIImageView *)tabImagebgView{
    if (!_tabImagebgView) {
        _tabImagebgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
        
    }
    return _tabImagebgView;

}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.tabImagebgView.frame=self.bounds;
    CGFloat width=self.bounds.size.width/self.dataList.count;
    for (NSInteger index=0; index<[self subviews].count; index++) {
        UIView *btn = [self subviews][index];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame=CGRectMake((btn.tag-MJItemTypeLive)*width, 0, width, self.frame.size.height);
            
        }
    }
}


-(NSArray *)dataList{
    if (!_dataList) {
        _dataList=@[@"tab_live",@"tab_me"];
    }
    return _dataList;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //装载
        [self addSubview:self.tabImagebgView];
        //装载item
        for (NSInteger index=0; index<self.dataList.count; index++) {
            UIButton *item=[UIButton buttonWithType:UIButtonTypeCustom];
            [item setImage:[UIImage imageNamed:self.dataList[index]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.dataList[index] stringByAppendingString:@"_p"]] forState:UIControlStateNormal];
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            item.tag=MJItemTypeLive+index;
            [self addSubview:item];
        }
        
    }
    return self;
}

-(void)clickItem:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]) {
        [self.delegate tabbar:self clickButton:button.tag];
    }
    //if (self.block) {
    //    self.block(self,button.tag);
    //}
 //   !self.block?:self.block(self,button.tag);
}



@end
