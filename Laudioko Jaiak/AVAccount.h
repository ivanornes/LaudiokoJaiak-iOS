//
//  AVAccount.h
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 24/07/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVAccount : NSObject<NSCoding>

+ (AVAccount*)account;

@property (nonatomic, strong)NSString *lang;

@end
