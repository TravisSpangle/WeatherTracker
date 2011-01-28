//
//  Station.m
//  RandomStation
//
//  Created by Travis Spangle on 01/28/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import "Station.h"

@implementation Station
//@synthesize possessionName, serialNumber, valueInDollars, dateCreated;
@synthesize stationName, stationCode, longitude, latitude;

#pragma mark init methods

+(id)randomStation
{
	NSArray *randomStartList = [NSArray arrayWithObjects:@"SEA", @"TAC", @"MUK", nil];
	NSArray *randomEndList = [NSArray arrayWithObjects:@"EATTLE", @"OMA",@"ILTIO",nil];
	
	int adjectiveIndex = random()%[randomStartList count];
	int nounIndex = random()%[randomEndList count];
	
	NSString *randomStationName = [NSString stringWithFormat:@"%@%@",
							[randomStartList objectAtIndex:adjectiveIndex],
							[randomEndList objectAtIndex:nounIndex]];
	
	NSString *randomCode = [NSString stringWithFormat:@"RAND"];
	
	float randomLatitude = (float)rand() / 100.00f;
	float randomLongitude = (float)rand() / 100.00f;
	//int randomValue = random() % 100;
	
	/*NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
							'0' + random() % 10,
							'A' + random() % 26,
							'0' + random() % 10,
							'A' + random() % 26,
							'0' + random() % 10];*/
	//Once again, ingnore the memory problems iwth this method
	//We use "self" instead of the name of the class in class methods...
	//Keep reading to find out why
	
	/*station *newStation = 
		[[[self alloc] initWithPossessionName:randomStationName
							  valueInDollars:randomValue
								serialNumber:randomSerialNumber] autorelease];*/
	
	Station *newStation = 
	[[[self alloc] initWithStationName: randomStationName 
						   stationCode:randomCode 
							  latitude:randomLatitude 
							 longitude:randomLongitude] autorelease];
	return newStation;
}

-(id)init
{
	/*return [self initWithStationName:@"New Station"
						 stationCode:0
						   serialNumber:@""];*/
	return [self initWithStationName:@"New Station" 
						 stationCode:@"NEW" 
							latitude:00.00 
						   longitude:00.00];
}

-(id)initWithStationName:(NSString *)name
{
	return [self initWithStationName:name
						 stationCode:@"NEW" 
							latitude:00.00 
						   longitude:00.00];
}

/*
- (id)initWithPossessionName:(NSString *)name 
			  valueInDollars:(int)value 
				serialNumber:(NSString *)sNumber
{
	//Call the superclass's designated initializer
	self = [super init];
	
	//did the initialization fail?
	if (!self)
		return nil;
	
	//Give the instance variables initial values
	[self setPossessionName:name];
	[self setValueInDollars:value];
	[self setSerialNumber:sNumber];
	dateCreated = [[NSDate alloc] init];
	
	//Return the address of the newly initialzied object
	return self;
}*/

- (id)initWithStationName:(NSString *)name
			  stationCode:(NSString *)code
				 latitude:(float)lat
				longitude:(float)lon {
	self = [super init];
	
	if(!self)
		return nil;
	
	[self setStationName:name];
	[self setStationCode:code];
	self.latitude = lat;
	self.longitude = lon;
	
	return self;
}

#pragma mark Action methods
/*
-(NSString *)description
{
	NSString *descriptionString = 
	[[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, Recorded on %@",
	 possessionName,
	 serialNumber,
	 valueInDollars,
	  dateCreated];
	
	return [descriptionString autorelease];
}
 */

#pragma mark Dealloc

- (void)dealloc
{
	[stationName release];
	[stationCode release];
	
	/*
	[possessionName release];
	[serialNumber release];
	[dateCreated release];
	 */
	[super dealloc];
}
	
@end
