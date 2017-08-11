//
//  AVAccount.m
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 24/07/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import "AVAccount.h"
#define ARCHIEVE_FILE_NAME  @"account.txt"

@implementation AVAccount
@synthesize lang = _lang;

- (id)init
{
    self = [super init];
    if (self) {
        _lang = nil;
    }
    return self;
}

+ (NSString *) _dataFilePath
{
	NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString * documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:ARCHIEVE_FILE_NAME];
}

+ (AVAccount*)account{
    static AVAccount *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[AVAccount alloc] init];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:[AVAccount _dataFilePath]]) {
            NSData *data = [[NSData alloc]initWithContentsOfFile:[AVAccount _dataFilePath]];
            NSKeyedUnarchiver *desarchivador = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
            
            _sharedInstance.lang = [desarchivador decodeObjectForKey:@"_lang"];
            
            [desarchivador finishDecoding];
            //NSLog(@"Estado Cargado");
        }
    });
    
    return _sharedInstance;
}

- (void) setLang:(NSString *)lang{
    _lang = lang;
    [self guardarEstado];
}


- (void) guardarEstado
{
    NSMutableData *datosAGuardar = [[NSMutableData alloc]init];
    NSKeyedArchiver *archivador = [[NSKeyedArchiver alloc]initForWritingWithMutableData:datosAGuardar];
    
    [archivador encodeObject:_lang forKey:@"_lang"];
    
    [archivador finishEncoding];
    [datosAGuardar writeToFile:[AVAccount _dataFilePath] atomically:YES];
    //NSLog(@"Guardando Estado");
}

#pragma mark Serialization
- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_lang forKey:@"_lang"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        _lang = [decoder decodeObjectForKey:@"_lang"];
    }
    return self;
}

@end
