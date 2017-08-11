// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Evento.m instead.

#import "_Evento.h"

const struct EventoAttributes EventoAttributes = {
	.createdAt = @"createdAt",
	.day = @"day",
	.descripcionEs = @"descripcionEs",
	.descripcionEu = @"descripcionEu",
	.favorito = @"favorito",
	.hashtag = @"hashtag",
	.horaEs = @"horaEs",
	.horaEu = @"horaEu",
	.icono = @"icono",
	.identifier = @"identifier",
	.latitud = @"latitud",
	.longitud = @"longitud",
	.lugarEs = @"lugarEs",
	.lugarEu = @"lugarEu",
	.orden = @"orden",
	.titleEs = @"titleEs",
	.titleEu = @"titleEu",
	.updatedAt = @"updatedAt",
};

const struct EventoRelationships EventoRelationships = {
};

const struct EventoFetchedProperties EventoFetchedProperties = {
};

@implementation EventoID
@end

@implementation _Evento

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Evento" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Evento";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Evento" inManagedObjectContext:moc_];
}

- (EventoID*)objectID {
	return (EventoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"dayValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"day"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"favoritoValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"favorito"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"identifierValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"identifier"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"latitudValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitud"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitud"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"ordenValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"orden"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic createdAt;






@dynamic day;



- (int16_t)dayValue {
	NSNumber *result = [self day];
	return [result shortValue];
}

- (void)setDayValue:(int16_t)value_ {
	[self setDay:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveDayValue {
	NSNumber *result = [self primitiveDay];
	return [result shortValue];
}

- (void)setPrimitiveDayValue:(int16_t)value_ {
	[self setPrimitiveDay:[NSNumber numberWithShort:value_]];
}





@dynamic descripcionEs;






@dynamic descripcionEu;






@dynamic favorito;



- (BOOL)favoritoValue {
	NSNumber *result = [self favorito];
	return [result boolValue];
}

- (void)setFavoritoValue:(BOOL)value_ {
	[self setFavorito:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveFavoritoValue {
	NSNumber *result = [self primitiveFavorito];
	return [result boolValue];
}

- (void)setPrimitiveFavoritoValue:(BOOL)value_ {
	[self setPrimitiveFavorito:[NSNumber numberWithBool:value_]];
}





@dynamic hashtag;






@dynamic horaEs;






@dynamic horaEu;






@dynamic icono;






@dynamic identifier;



- (int16_t)identifierValue {
	NSNumber *result = [self identifier];
	return [result shortValue];
}

- (void)setIdentifierValue:(int16_t)value_ {
	[self setIdentifier:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveIdentifierValue {
	NSNumber *result = [self primitiveIdentifier];
	return [result shortValue];
}

- (void)setPrimitiveIdentifierValue:(int16_t)value_ {
	[self setPrimitiveIdentifier:[NSNumber numberWithShort:value_]];
}





@dynamic latitud;



- (float)latitudValue {
	NSNumber *result = [self latitud];
	return [result floatValue];
}

- (void)setLatitudValue:(float)value_ {
	[self setLatitud:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLatitudValue {
	NSNumber *result = [self primitiveLatitud];
	return [result floatValue];
}

- (void)setPrimitiveLatitudValue:(float)value_ {
	[self setPrimitiveLatitud:[NSNumber numberWithFloat:value_]];
}





@dynamic longitud;



- (float)longitudValue {
	NSNumber *result = [self longitud];
	return [result floatValue];
}

- (void)setLongitudValue:(float)value_ {
	[self setLongitud:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLongitudValue {
	NSNumber *result = [self primitiveLongitud];
	return [result floatValue];
}

- (void)setPrimitiveLongitudValue:(float)value_ {
	[self setPrimitiveLongitud:[NSNumber numberWithFloat:value_]];
}





@dynamic lugarEs;






@dynamic lugarEu;






@dynamic orden;



- (int16_t)ordenValue {
	NSNumber *result = [self orden];
	return [result shortValue];
}

- (void)setOrdenValue:(int16_t)value_ {
	[self setOrden:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveOrdenValue {
	NSNumber *result = [self primitiveOrden];
	return [result shortValue];
}

- (void)setPrimitiveOrdenValue:(int16_t)value_ {
	[self setPrimitiveOrden:[NSNumber numberWithShort:value_]];
}





@dynamic titleEs;






@dynamic titleEu;






@dynamic updatedAt;











@end
