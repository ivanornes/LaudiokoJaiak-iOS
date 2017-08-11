//
//  AVEventTableViewCell.m
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 24/07/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import "AVEventTableViewCell.h"

@implementation AVEventTableViewCell
@synthesize leftView = _leftView;
@synthesize rigthView = _rigthView;
@synthesize eventCategory = _eventCategory;
@synthesize eventHour = _eventHour;
@synthesize eventTitle = _eventTitle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
