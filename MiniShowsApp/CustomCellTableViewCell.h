//
//  CustomCellTableViewCell.h
//  MiniShowsApp
//
//  Created by Ricardo Maqueda on 18/06/14.
//  Copyright (c) 2014 Molestudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *episodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *showImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalState;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *horizontalState;


@end
