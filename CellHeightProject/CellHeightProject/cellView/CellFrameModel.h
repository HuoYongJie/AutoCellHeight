//
//  CellFrameModel.h
//  CellHeightProject
//
//  Created by hyj on 17/3/8.
//  Copyright © 2017年 hyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface CellFrameModel : NSObject

@property (nonatomic,assign,readonly) CGRect iconF;
@property (nonatomic,assign,readonly) CGRect nameF;
@property (nonatomic,assign,readonly) CGRect textF;
@property (nonatomic,assign,readonly) CGRect pictureF;


@property (nonatomic,assign,readonly) CGFloat cellHeight;
@property (nonatomic,strong)CellModel *cellModel;
@end
