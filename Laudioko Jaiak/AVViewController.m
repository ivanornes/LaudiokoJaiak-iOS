//
//  AVViewController.m
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 25/06/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import "AVViewController.h"

#import "AVEventDetailViewController.h"
#import "AVLangSelectViewController.h"
#import "AVEventTableViewCell.h"

#import "AVHTTPClient.h"
#import "Evento.h"
#import "AVConstants.h"

#include <mach-o/dyld.h>
#import <SWTableViewCell/SWTableViewCell.h>
#import <FontAwesomeKit/FontAwesomeKit.h>

@interface AVViewController ()<UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, retain)NSFetchedResultsController *eventosController;
@property (strong,nonatomic) NSMutableArray *filteredEventArray;
@property (strong,nonatomic) UIRefreshControl *refreshControl;
@property (strong,nonatomic) AVHTTPClient *client;

@end

@implementation AVViewController
@synthesize eventosController = _eventosController;
@synthesize eventsSearchBar = _eventsSearchBar;
@synthesize filteredEventArray = _filteredEventArray;
@synthesize eventsSearchDisplayController = _eventsSearchDisplayController;
@synthesize client = _client;
@synthesize account = _account;
@synthesize refreshControl = _refreshControl;
@synthesize tableView = _tableView;

- (void)loadData
{

    [self reloadTable];
    [_client getEventos:^{
        [self reloadTable];
        [_refreshControl endRefreshing];
    } andError:^{
        [_refreshControl endRefreshing];
    }];
    
}

- (void)selectLang
{
    AVLangSelectViewController *avLangSelectVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AVLangSelectViewController"];
    [self presentViewController:avLangSelectVC animated:YES completion:^{
        [self loadData];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    _account = [AVAccount account];
    
    _filteredEventArray = [NSMutableArray new];
    
    _client = [AVHTTPClient sharedInstance];
    
    if (_account.lang) {
        [self loadData];
    }else{
        [self selectLang];
    }
    
    _refreshControl = [[UIRefreshControl alloc]init];
    [_tableView addSubview:_refreshControl];
    [_refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    
    _header.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadTable
{
    NSError *error;
    [[self fetchedResultsController] performFetch:&error];
    [self.tableView reloadData];
    
}

- (IBAction)infoButton:(id)sender {
    [self selectLang];
}

- (IBAction)settingsButton:(id)sender {
    
}

#pragma mark UITableview DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[_eventosController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return _filteredEventArray.count;
    }else{
        id <NSFetchedResultsSectionInfo> sectionInfo =
        [[_eventosController sections] objectAtIndex:section];
        
        return [sectionInfo numberOfObjects];
    }
}

- (UIImage *)eventIconImage:(Evento *)evento {
    UIImage *iconImage;
    FAKFontAwesome *starIcon = nil;
    if ([evento.favorito isEqualToNumber:@(0)]) {
        starIcon = [FAKFontAwesome starOIconWithSize:40];
    }else {
        starIcon = [FAKFontAwesome starIconWithSize:40];
    }
    
    [starIcon addAttribute:NSForegroundColorAttributeName value:[UIColor
                                                                 whiteColor]];
    iconImage = [starIcon imageWithSize:CGSizeMake(40, 40)];
    return iconImage;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *TableViewCellIdentifier = @"eventCell";
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    AVEventTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    
    Evento *evento = nil;

    if (tableView == self.searchDisplayController.searchResultsTableView) {
        evento = [_filteredEventArray objectAtIndex:indexPath.row];
    } else {
        evento = [_eventosController objectAtIndexPath:indexPath];
    }

    if ([_account.lang isEqualToString:KEusEtq]) {
        cell.eventTitle.text = evento.titleEu;
        cell.eventHour.text = evento.horaEu;
    }else{
        cell.eventTitle.text = evento.titleEs;
        cell.eventHour.text = evento.horaEs;
    }
    
    if (evento.icono) {
        cell.eventCategory.image = [UIImage imageNamed:evento.icono];
    }else{
        cell.eventCategory.image = nil;
    }
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:UIColorFromRGB(0xc8167e) icon:[self eventIconImage:evento]];
    
    cell.rightUtilityButtons = rightUtilityButtons;
    cell.delegate = self;
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    id <NSFetchedResultsSectionInfo> sectionInfo =
    [[_eventosController sections] objectAtIndex:section];
    
    return [NSString stringWithFormat:@"día %@", [sectionInfo name]];
}

#pragma mark UITableview Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Evento *evento = [_eventosController objectAtIndexPath:indexPath];
    AVEventDetailViewController *eventVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AVEventDetailViewController"];
    [eventVC setEvento:evento];
    [eventVC setEventosController:_eventosController];
    [eventVC setIndexPath:indexPath];
    [self.navigationController pushViewController:eventVC animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showEvento"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Evento *evento = [_eventosController objectAtIndexPath:indexPath];
        AVEventDetailViewController *eventVC = [segue destinationViewController];
        [eventVC setEvento:evento];
        [eventVC setEventosController:_eventosController];
        [eventVC setIndexPath:indexPath];
    }
}

#pragma SWTableViewDelegate
- (void)swipeableTableViewCell:(AVEventTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index{
    NSIndexPath *indiceDeEntrada = [_tableView indexPathForCell:cell];
    Evento *evento = [_eventosController objectAtIndexPath:indiceDeEntrada];
    
    switch (index) {
        case 0:{
            //Favorito

            if ([evento.favorito isEqualToNumber:@(0)]) {
                evento.favorito = @(1);
            }else {
                evento.favorito = @(0);
            }
            
            [MagicalRecord saveUsingCurrentThreadContextWithBlockAndWait:^(NSManagedObjectContext *localContext) {}];
        }
            break;
        default:
            break;
    }
    
    [cell hideUtilityButtonsAnimated:YES];
    cell.eventCategory.image = [self eventIconImage:evento];
    [self performSelector:@selector(reloadSelectedCellAtIndexPath:) withObject:indiceDeEntrada afterDelay:0.5];

}

-(void)reloadSelectedCellAtIndexPath:(NSIndexPath*)indexPath{
    [_tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [_tableView endUpdates];
}

#pragma FetchedResults Controller
- (NSFetchedResultsController *)fetchedResultsController{
    
    if ([_header isMenuSelected]) {

        _eventosController = [Evento MR_fetchAllGroupedBy:@"day" withPredicate:nil sortedBy:@"day" ascending:YES];
        
        NSSortDescriptor *sortOrden = [[NSSortDescriptor alloc] initWithKey:@"orden" ascending:YES];
        NSSortDescriptor *sortDay = [[NSSortDescriptor alloc] initWithKey:@"day" ascending:YES];
        
        [_eventosController.fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDay,sortOrden,nil]];
        
        
        NSError *error;
        
        [_eventosController performFetch:&error];
    }else{
        _eventosController = [Evento MR_fetchAllGroupedBy:@"day" withPredicate:[NSPredicate predicateWithFormat:@"favorito = 1"] sortedBy:@"day" ascending:YES];
        
        NSSortDescriptor *sortOrden = [[NSSortDescriptor alloc] initWithKey:@"orden" ascending:YES];
        NSSortDescriptor *sortDay = [[NSSortDescriptor alloc] initWithKey:@"day" ascending:YES];
        
        [_eventosController.fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDay,sortOrden,nil]];
        
        
        NSError *error;
        
        [_eventosController performFetch:&error];
    }
    
    
    return _eventosController;
    
}

#pragma mark AVMainHeader Delegate
- (void)mainHeaderView:(AVMainHeader *)header didSelectedSegment:(NSUInteger)segment{
//    if (segment == 0) {
//        self.view.backgroundColor = UIColorFromRGB(0xC8167E);
//    }else{
//        self.view.backgroundColor = UIColorFromRGB(0x971B67);    
//    }
    [self reloadTable];
}
@end

