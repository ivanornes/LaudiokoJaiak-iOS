//
//  AVEventDetailViewController.m
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 25/06/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import "AVEventDetailViewController.h"
#import <FontAwesomeKit/FontAwesomeKit.h>
#import "AVConstants.h"
#import "QuartzCore/CALayer.h"

@interface AVEventDetailViewController ()

@end

@implementation AVEventDetailViewController
@synthesize evento = _evento;
@synthesize eventDescriptionLabel = _eventDescriptionLabel;
@synthesize eventHourLabel = _eventHourLabel;
@synthesize eventIconImageView = _eventIconImageView;
@synthesize eventNameLabel = _eventNameLabel;
@synthesize eventosController = _eventosController;
@synthesize indexPath = _indexPath;
@synthesize previousButton = _previousButton;
@synthesize backButton = _backButton;
@synthesize nextButton = _nextButton;
@synthesize eventDescriptionTextView = _eventDescriptionTextView;
@synthesize tabBar = _tabBar;
@synthesize imageContainerView = _imageContainerView;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _account = [AVAccount account];

    if ([_account.lang isEqualToString:KEusEtq]) {
        _eventNameLabel.text = _evento.titleEu;
        _eventDescriptionLabel.text = _evento.descripcionEu;
        _eventDescriptionTextView.text = _evento.descripcionEu;
        _eventHourLabel.text = _evento.horaEu;
    }else{
        _eventNameLabel.text = _evento.titleEs;
        _eventDescriptionLabel.text = _evento.descripcionEs;
        _eventDescriptionTextView.text = _evento.descripcionEs;
        _eventHourLabel.text = _evento.horaEs;
    }

    _eventIconImageView.layer.cornerRadius = 40;
    _eventIconImageView.clipsToBounds = YES;
    _imageContainerView.layer.cornerRadius = 40;
    
    _imageContainerView.layer.shadowColor = [[UIColor blackColor] CGColor];
    _imageContainerView.layer.shadowOffset = CGSizeMake(1.f, 1.f);
    _imageContainerView.layer.shadowOpacity = 0.5f;
    _imageContainerView.layer.shadowRadius = 40;
    _imageContainerView.clipsToBounds = NO;

    if (_evento.icono) {
        _eventIconImageView.image  = [UIImage imageNamed:_evento.icono];
    }else{
        _eventIconImageView.image  = nil;
    }
    
    [_previousButton setImage:[[self previousEventImageWithColor:UIColorFromRGB(0xC8157E)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [_nextButton setImage:[[self nextEventImageWithColor:UIColorFromRGB(0xC8157E)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [_backButton setImage:[[self eventlistImageWithColor:UIColorFromRGB(0xC8157E)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    [_previousButton setSelectedImage:[[self previousEventImageWithColor:UIColorFromRGB(0x971B67)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [_nextButton setSelectedImage:[[self nextEventImageWithColor:UIColorFromRGB(0x971B67)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [_backButton setSelectedImage:[[self eventlistImageWithColor:UIColorFromRGB(0x971B67)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [_previousButton setImageInsets:UIEdgeInsetsMake(3, 0, -3, 0)];
    [_nextButton setImageInsets:UIEdgeInsetsMake(3, 0, -3, 0)];
    [_backButton setImageInsets:UIEdgeInsetsMake(3, 0, -3, 0)];
    
    [_tabBar setSelectedImageTintColor:UIColorFromRGB(0xC8157E)];
    
    [_eventDescriptionLabel sizeToFit];
}

-(UIStatusBarStyle)preferredStatusBarStyle{

    return UIStatusBarStyleLightContent;

}

- (UIImage *)previousEventImageWithColor:(UIColor *)color{

    FAKFontAwesome *previousFA = [FAKFontAwesome arrowLeftIconWithSize:40];
    
    [previousFA addAttribute:NSForegroundColorAttributeName value:color];
    return [previousFA imageWithSize:CGSizeMake(40, 40)];
}

- (UIImage *)nextEventImageWithColor:(UIColor *)color{
    
    FAKFontAwesome *nextFA = [FAKFontAwesome arrowRightIconWithSize:40];
    
    [nextFA addAttribute:NSForegroundColorAttributeName value:color];
    return [nextFA imageWithSize:CGSizeMake(40, 40)];
}

- (UIImage *)eventlistImageWithColor:(UIColor *)color{
    
    FAKFontAwesome *eventListFA = [FAKFontAwesome reorderIconWithSize:40];
    
    [eventListFA addAttribute:NSForegroundColorAttributeName value:color];
    return [eventListFA imageWithSize:CGSizeMake(40, 40)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITabBar delegate

- (void)setEventAt:(NSIndexPath *)indexPath inEventVC:(AVEventDetailViewController *)eventVC {
    Evento *evento = [_eventosController objectAtIndexPath:indexPath];
    [eventVC setEvento:evento];
    [eventVC setEventosController:_eventosController];
    [eventVC setIndexPath:indexPath];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSUInteger indexOfTab = [[tabBar items] indexOfObject:item];
    
    switch (indexOfTab) {
        case 0:{
            if (_indexPath.row>0) {
                
                AVEventDetailViewController *previousEvent = [self.storyboard instantiateViewControllerWithIdentifier:@"AVEventDetailViewController"];
                
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_indexPath.row-1 inSection:_indexPath.section];
                
                [self setEventAt:indexPath inEventVC:previousEvent];
                
                [self.navigationController pushViewController:previousEvent animated:NO];
                
            }else if (_indexPath.section>0) {
                
                    AVEventDetailViewController *previousEvent = [self.storyboard instantiateViewControllerWithIdentifier:@"AVEventDetailViewController"];
                
                    NSArray *sections = [_eventosController sections];
                    id <NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:_indexPath.section-1];
                
                    NSUInteger numberOfObjectsInPreviousSection = [sectionInfo numberOfObjects];
                
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:numberOfObjectsInPreviousSection-1 inSection:_indexPath.section-1];
                    
                    [self setEventAt:indexPath inEventVC:previousEvent];
                    
                    [self.navigationController pushViewController:previousEvent animated:NO];
                }
        }
            break;
        case 1:
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            
            break;
        case 2:{
            
            id <NSFetchedResultsSectionInfo> sectionInfo =
            [[_eventosController sections] objectAtIndex:_indexPath.section];
            //NSLog(@"row %d section %d objects %d", _indexPath.row,_indexPath.section, [sectionInfo numberOfObjects]);
            if (_indexPath.row<([sectionInfo numberOfObjects]-1)) {
                
                AVEventDetailViewController *nextEvent = [self.storyboard instantiateViewControllerWithIdentifier:@"AVEventDetailViewController"];
                
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_indexPath.row+1 inSection:_indexPath.section];
                
                [self setEventAt:indexPath inEventVC:nextEvent];
                
                [self.navigationController pushViewController:nextEvent animated:NO];
                
            }else if (_indexPath.section<[[_eventosController sections] count]) {
                
                AVEventDetailViewController *nextEvent = [self.storyboard instantiateViewControllerWithIdentifier:@"AVEventDetailViewController"];
                
                NSArray *sections = [_eventosController sections];
                if (_indexPath.section+1 < sections.count) {

                    id <NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:_indexPath.section+1];
                    
                    NSUInteger numberOfObjectsInNextSection = [sectionInfo numberOfObjects];
                    
                    if (numberOfObjectsInNextSection>0) {
                        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:_indexPath.section+1];
                        
                        [self setEventAt:indexPath inEventVC:nextEvent];
                        
                        [self.navigationController pushViewController:nextEvent animated:NO];
                        
                    }
                }
            }

        }
            
            break;
        default:
            break;
    }
}

@end
