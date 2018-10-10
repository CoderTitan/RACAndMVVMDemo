//
//  HomeTableViewCell.h
//  RACAndMVVM
//
//  Created by quanjunt on 2018/10/10.
//  Copyright © 2018年 quanjunt. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UIButton *numView;


@end

NS_ASSUME_NONNULL_END
