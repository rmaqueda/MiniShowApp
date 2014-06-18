//
//  show.h
//  MiniShowsApp
//
//  Created by Ricardo Maqueda on 18/06/14.
//  Copyright (c) 2014 Molestudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Show : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* episode;
@property (nonatomic, strong) NSString* state;
@property (nonatomic, strong) NSString *descShow;
@property (nonatomic, strong) UIImage *image;

@end


