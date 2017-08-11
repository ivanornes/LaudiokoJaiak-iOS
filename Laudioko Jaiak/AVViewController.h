//
//  AVViewController.h
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 25/06/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVEventsSearchDisplayController.h"
#import "AVAccount.h"
#import <SWTableViewCell/SWTableViewCell.h>
#import "AVMainHeader.h"

@interface AVViewController : UIViewController<SWTableViewCellDelegate,AVMainHeaderDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *eventsSearchBar;
@property (strong, nonatomic) IBOutlet AVEventsSearchDisplayController *eventsSearchDisplayController;

@property (weak, nonatomic) AVAccount *account;

@property (weak, nonatomic) IBOutlet AVMainHeader *header;

@end
