//
//  MJTabBar.h
//  AllLifeShow
//
//  Created by 邓茂江 on 16/10/8.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,MJItemType){
    MJItemTypeLive =100,//展示直播
    MJItemTypeMe ,//我的
    
};

@class MJTabBar;

typedef void(^TabBlock)(MJTabBar *tabbar,MJItemType idx);

@protocol MJReturnDelegate <NSObject>
-(void)tabbar:(MJTabBar *)tabbar clickButton:(MJItemType) idx;

@end

@interface MJTabBar : UIView
@property(nonatomic,weak) id<MJReturnDelegate> delegate;
@property(nonatomic,copy) TabBlock block;
@end
