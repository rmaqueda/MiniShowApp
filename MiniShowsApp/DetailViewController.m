//
//  DetailViewController.m
//  MiniShowsApp
//
//  Created by Ricardo Maqueda on 18/06/14.
//  Copyright (c) 2014 Molestudio. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextField *descShow;

@end

@implementation DetailViewController





- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self fillData];
}

- (void)fillData
{
    self.title = self.show.title;
    self.image.image = self.show.image;
    self.descShow.text = self.show.descShow;

}

@end
