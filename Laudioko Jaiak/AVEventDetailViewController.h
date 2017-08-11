//
//  AVEventDetailViewController.h
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 25/06/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Evento.h"
#import "AVAccount.h"

@interface AVEventDetailViewController : UIViewController<UITabBarDelegate>

@property (nonatomic, strong) Evento *evento;
@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventHourLabel;
@property (weak, nonatomic) IBOutlet UIImageView *eventIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *eventDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextView *eventDescriptionTextView;

@property (nonatomic, retain)NSFetchedResultsController *eventosController;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UITabBarItem *previousButton;
@property (weak, nonatomic) IBOutlet UITabBarItem *backButton;
@property (weak, nonatomic) IBOutlet UITabBarItem *nextButton;

@property (weak, nonatomic) AVAccount *account;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (weak, nonatomic) IBOutlet UIView *imageContainerView;

@end
