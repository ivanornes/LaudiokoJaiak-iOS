//
//  AVMainHeader.h
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 27/07/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AVMainHeader;

typedef enum ShapeType : NSUInteger {
    kMenu = 0,
    kFav = 1
} MenuIndex;

typedef int SelectedIndex;

@protocol AVMainHeaderDelegate

@optional

- (void)mainHeaderView:(AVMainHeader *)header didSelectedSegment:(NSUInteger)segment;

@end

@interface AVMainHeader : UIView
@property (weak, nonatomic) IBOutlet UIView *menuSegment;
@property (weak, nonatomic) IBOutlet UIButton *menuButon;
@property (weak, nonatomic) IBOutlet UIView *starSegment;
@property (weak, nonatomic) IBOutlet UIButton *starButon;
@property (weak, nonatomic) IBOutlet UIView *headerLine;
@property (weak, nonatomic) id <AVMainHeaderDelegate> delegate;
@property SelectedIndex index;

- (BOOL)isMenuSelected;
@end
