//
//  AVEventTableViewCell.h
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 24/07/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"

@interface AVEventTableViewCell : SWTableViewCell
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rigthView;
@property (weak, nonatomic) IBOutlet UIImageView *eventCategory;
@property (weak, nonatomic) IBOutlet UILabel *eventTitle;
@property (weak, nonatomic) IBOutlet UILabel *eventHour;

@end
