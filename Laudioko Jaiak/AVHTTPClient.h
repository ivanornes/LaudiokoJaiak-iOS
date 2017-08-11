//
//  AVHTTPClient.h
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 06/07/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^success)(BOOL);
typedef void(^error)(BOOL);

@interface AVHTTPClient : NSObject

+ (AVHTTPClient*)sharedInstance;

- (void)getEventos:(void (^)())success andError:(void (^)())responseError;

@end
