//
//  AVMainHeader.m
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 27/07/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import "AVMainHeader.h"

@implementation AVMainHeader
@synthesize menuButon = _menuButon;
@synthesize menuSegment = _menuSegment;
@synthesize starButon = _starButon;
@synthesize starSegment = _starSegment;
@synthesize headerLine = _headerLine;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(IBAction)menuSelected:(id)sender{
    _headerLine.backgroundColor = _menuSegment.backgroundColor;
    _index = kMenu;
    [_delegate mainHeaderView:self didSelectedSegment:_index];
}

-(IBAction)favSelected:(id)sender{
    _headerLine.backgroundColor = _starSegment.backgroundColor;
    _index = kFav;
    [_delegate mainHeaderView:self didSelectedSegment:_index];
}

- (BOOL)isMenuSelected{
    return _index == 0?YES:NO;
}
@end
