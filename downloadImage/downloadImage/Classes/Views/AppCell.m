//
//  AppCell.m
//  downloadImage
//
//  Created by 黄跃奇 on 16/8/22.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"

@implementation AppCell

- (void)setApp:(AppModel *)app {
    
    _app = app;
    
    self.nameLabel.text = app.name;
    self.downloadLabel.text = app.download;
    
}

@end
