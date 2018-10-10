//
//  HomeCellViewModel.m
//  RACAndMVVM
//
//  Created by quanjunt on 2018/10/10.
//  Copyright © 2018年 quanjunt. All rights reserved.
//

#import "HomeCellViewModel.h"
#import "HomeTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "HomeModel.h"

@implementation HomeCellViewModel

- (void)bindViewModel:(UIView *)bindView {
    HomeTableViewCell *cell = (HomeTableViewCell *)bindView;
    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:_model.courseImage]];
    cell.nameView.text = _model.courseName;
    [cell.numView setTitle:_model.studentNum forState:UIControlStateNormal];
}
@end
