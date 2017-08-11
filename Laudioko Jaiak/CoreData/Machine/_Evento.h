// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Evento.h instead.

#import <CoreData/CoreData.h>


extern const struct EventoAttributes {
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *day;
	__unsafe_unretained NSString *descripcionEs;
	__unsafe_unretained NSString *descripcionEu;
	__unsafe_unretained NSString *favorito;
	__unsafe_unretained NSString *hashtag;
	__unsafe_unretained NSString *horaEs;
	__unsafe_unretained NSString *horaEu;
	__unsafe_unretained NSString *icono;
	__unsafe_unretained NSString *identifier;
	__unsafe_unretained NSString *latitud;
	__unsafe_unretained NSString *longitud;
	__unsafe_unretained NSString *lugarEs;
	__unsafe_unretained NSString *lugarEu;
	__unsafe_unretained NSString *orden;
	__unsafe_unretained NSString *titleEs;
	__unsafe_unretained NSString *titleEu;
	__unsafe_unretained NSString *updatedAt;
} EventoAttributes;

extern const struct EventoRelationships {
} EventoRelationships;

extern const struct EventoFetchedProperties {
} EventoFetchedProperties;





















@interface EventoID : NSManagedObjectID {}
@end

@interface _Evento : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EventoID*)objectID;





@property (nonatomic, strong) NSString* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* day;



@property int16_t dayValue;
- (int16_t)dayValue;
- (void)setDayValue:(int16_t)value_;

//- (BOOL)validateDay:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* descripcionEs;



//- (BOOL)validateDescripcionEs:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* descripcionEu;



//- (BOOL)validateDescripcionEu:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* favorito;



@property BOOL favoritoValue;
- (BOOL)favoritoValue;
- (void)setFavoritoValue:(BOOL)value_;

//- (BOOL)validateFavorito:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* hashtag;



//- (BOOL)validateHashtag:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* horaEs;



//- (BOOL)validateHoraEs:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* horaEu;



//- (BOOL)validateHoraEu:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* icono;



//- (BOOL)validateIcono:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* identifier;



@property int16_t identifierValue;
- (int16_t)identifierValue;
- (void)setIdentifierValue:(int16_t)value_;

//- (BOOL)validateIdentifier:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* latitud;



@property float latitudValue;
- (float)latitudValue;
- (void)setLatitudValue:(float)value_;

//- (BOOL)validateLatitud:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* longitud;



@property float longitudValue;
- (float)longitudValue;
- (void)setLongitudValue:(float)value_;

//- (BOOL)validateLongitud:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lugarEs;



//- (BOOL)validateLugarEs:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lugarEu;



//- (BOOL)validateLugarEu:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* orden;



@property int16_t ordenValue;
- (int16_t)ordenValue;
- (void)setOrdenValue:(int16_t)value_;

//- (BOOL)validateOrden:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* titleEs;



//- (BOOL)validateTitleEs:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* titleEu;



//- (BOOL)validateTitleEu:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;






@end

@interface _Evento (CoreDataGeneratedAccessors)

@end

@interface _Evento (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSString*)value;




- (NSNumber*)primitiveDay;
- (void)setPrimitiveDay:(NSNumber*)value;

- (int16_t)primitiveDayValue;
- (void)setPrimitiveDayValue:(int16_t)value_;




- (NSString*)primitiveDescripcionEs;
- (void)setPrimitiveDescripcionEs:(NSString*)value;




- (NSString*)primitiveDescripcionEu;
- (void)setPrimitiveDescripcionEu:(NSString*)value;




- (NSNumber*)primitiveFavorito;
- (void)setPrimitiveFavorito:(NSNumber*)value;

- (BOOL)primitiveFavoritoValue;
- (void)setPrimitiveFavoritoValue:(BOOL)value_;




- (NSString*)primitiveHashtag;
- (void)setPrimitiveHashtag:(NSString*)value;




- (NSString*)primitiveHoraEs;
- (void)setPrimitiveHoraEs:(NSString*)value;




- (NSString*)primitiveHoraEu;
- (void)setPrimitiveHoraEu:(NSString*)value;




- (NSString*)primitiveIcono;
- (void)setPrimitiveIcono:(NSString*)value;




- (NSNumber*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSNumber*)value;

- (int16_t)primitiveIdentifierValue;
- (void)setPrimitiveIdentifierValue:(int16_t)value_;




- (NSNumber*)primitiveLatitud;
- (void)setPrimitiveLatitud:(NSNumber*)value;

- (float)primitiveLatitudValue;
- (void)setPrimitiveLatitudValue:(float)value_;




- (NSNumber*)primitiveLongitud;
- (void)setPrimitiveLongitud:(NSNumber*)value;

- (float)primitiveLongitudValue;
- (void)setPrimitiveLongitudValue:(float)value_;




- (NSString*)primitiveLugarEs;
- (void)setPrimitiveLugarEs:(NSString*)value;




- (NSString*)primitiveLugarEu;
- (void)setPrimitiveLugarEu:(NSString*)value;




- (NSNumber*)primitiveOrden;
- (void)setPrimitiveOrden:(NSNumber*)value;

- (int16_t)primitiveOrdenValue;
- (void)setPrimitiveOrdenValue:(int16_t)value_;




- (NSString*)primitiveTitleEs;
- (void)setPrimitiveTitleEs:(NSString*)value;




- (NSString*)primitiveTitleEu;
- (void)setPrimitiveTitleEu:(NSString*)value;




- (NSString*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSString*)value;




@end
