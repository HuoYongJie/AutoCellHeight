//
//  BaseTableViewCell.h
//  CellHeightProject
//
//  Created by hyj on 17/3/8.
//  Copyright © 2017年 hyj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellFrameModel.h"
#import "CellModel.h"
@interface BaseTableViewCell : UITableViewCell

@property (nonatomic,strong) CellFrameModel *modelFrame;


-(void)showCellWithModel:(CellFrameModel *)frameModel indexPath:(NSIndexPath *)indexPath;
@end
