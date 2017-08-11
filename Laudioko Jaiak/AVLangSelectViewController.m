//
//  AVLangSelectViewController.m
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 24/07/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import "AVLangSelectViewController.h"

@interface AVLangSelectViewController ()

@end

@implementation AVLangSelectViewController
@synthesize euskera = _euskera;
@synthesize castellano = _castellano;
@synthesize account = _account;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (IBAction)euskera:(id)sender {
    _account.lang = KEusEtq;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)castellano:(id)sender {
    _account.lang = KCasEtq;
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
