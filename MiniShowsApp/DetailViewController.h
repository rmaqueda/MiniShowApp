//
//  DetailViewController.h
//  MiniShowsApp
//
//  Created by Ricardo Maqueda on 18/06/14.
//  Copyright (c) 2014 Molestudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
