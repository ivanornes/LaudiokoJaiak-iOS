//
//  AVLangSelectViewController.h
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 24/07/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVAccount.h"
#import "AVConstants.h"

@interface AVLangSelectViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *euskera;
@property (weak, nonatomic) IBOutlet UIButton *castellano;
@property (weak, nonatomic) AVAccount *account;

@end
