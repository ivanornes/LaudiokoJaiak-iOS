//
//  AVHTTPClient.m
//  Laudioko Jaiak
//
//  Created by Ivan Ornes on 06/07/14.
//  Copyright (c) 2014 Ayalavalley. All rights reserved.
//

#import "AVHTTPClient.h"

#import "Evento.h"
#import <RestKit.h>

#define KLifeAPIURL @"https://95.85.16.23:49154/"
#define KTestAPIURL @"https://laudiokojaiak.herokuapp.com/"

static NSString * const kLaudiokoJaiakStoreName = @"laudiokojaiak.sqlite";

// Use a class extension to expose access to MagicalRecord's private setter methods
@interface NSManagedObjectContext ()
+ (void)MR_setRootSavingContext:(NSManagedObjectContext *)context;
+ (void)MR_setDefaultContext:(NSManagedObjectContext *)moc;
@end

@implementation AVHTTPClient

+ (AVHTTPClient*)sharedInstance{

    static AVHTTPClient *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[AVHTTPClient alloc] init];
        
        
        NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
        NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:kLaudiokoJaiakStoreName];
        NSError *error = nil;
        [managedObjectStore addSQLitePersistentStoreAtPath:storePath fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:&error];
        [managedObjectStore createManagedObjectContexts];
        
        // Configure MagicalRecord to use RestKit's Core Data stack
        [NSPersistentStoreCoordinator MR_setDefaultStoreCoordinator:managedObjectStore.persistentStoreCoordinator];
        [NSManagedObjectContext MR_setRootSavingContext:managedObjectStore.persistentStoreManagedObjectContext];
        [NSManagedObjectContext MR_setDefaultContext:managedObjectStore.mainQueueManagedObjectContext];

        RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:KTestAPIURL]];
        objectManager.managedObjectStore = managedObjectStore;
        
        
        RKEntityMapping *eventMapping = [RKEntityMapping mappingForEntityForName:[Evento entityName] inManagedObjectStore:managedObjectStore];

        eventMapping.identificationAttributes = @[@"identifier"];

        [eventMapping addAttributeMappingsFromDictionary:@{
                                                           @"id" : @"identifier" ,
                                                           @"day" : @"day",
                                                           @"descripcion_es" : @"descripcionEs",
                                                           @"descripcion_eu" : @"descripcionEu",
                                                           @"hashtag" : @"hashtag",
                                                           @"hora_es" : @"horaEs",
                                                           @"hora_eu" : @"horaEu",
                                                           @"icono" : @"icono",
                                                           @"latitud" : @"latitud",
                                                           @"longitud" : @"longitud",
                                                           @"lugar_es" : @"lugarEs",
                                                           @"lugar_eu" : @"lugarEu",
                                                           @"orden" : @"orden",
                                                           @"title_es" : @"titleEs",
                                                           @"title_eu" : @"titleEu",
                                                           @"created_at" : @"createdAt",
                                                           @"updated_at" : @"updatedAt"
                                                           }];
        
        RKResponseDescriptor *eventoResponse = [RKResponseDescriptor responseDescriptorWithMapping:eventMapping method:RKRequestMethodGET pathPattern:@"eventos.json" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];

        [objectManager addResponseDescriptorsFromArray:@[eventoResponse]];

        [[RKObjectManager sharedManager] managedObjectStore].managedObjectCache = [RKFetchRequestManagedObjectCache new];
    });
    
    return _sharedInstance;
}

- (void)getEventos:(void (^)())success andError:(void (^)())responseError{
    __block NSArray *eventosOLD = [Evento MR_findAll];
    [[RKObjectManager sharedManager] getObjectsAtPath:@"eventos.json" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        //Si un evento no ha llegado se borra
        for (Evento *evento in eventosOLD) {
            if (![[mappingResult array] containsObject:evento]) {
                [evento MR_deleteEntity];
            }
        }
        
        success();
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        responseError();
    }];
}
@end
