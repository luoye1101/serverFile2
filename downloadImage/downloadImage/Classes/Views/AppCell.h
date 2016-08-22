//
//  AppCell.h
//  downloadImage
//
//  Created by 黄跃奇 on 16/8/22.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppModel;

@interface AppCell : UITableViewCell

@property(weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property(weak, nonatomic) IBOutlet UILabel *nameLabel;

@property(weak, nonatomic) IBOutlet UILabel *downloadLabel;

@property(strong, nonatomic) AppModel *app;

@end
