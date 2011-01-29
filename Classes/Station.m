//
//  Station.m
//  RandomStation
//
//  Created by Travis Spangle on 01/28/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import "Station.h"

@implementation Station
@synthesize stationName, stationCode, longitude, latitude;

#pragma mark init methods

+(id)randomStation
{
	NSArray *randomStartList = [NSArray arrayWithObjects:@"SEA", @"TAC", @"MUK", nil];
	NSArray *randomEndList = [NSArray arrayWithObjects:@"ATTLE", @"OMA",@"ILTIO",nil];
	
	int adjectiveIndex = random()%[randomStartList count];
	int nounIndex = random()%[randomEndList count];
	
	NSString *randomStationName = [NSString stringWithFormat:@"%@%@",
							[randomStartList objectAtIndex:adjectiveIndex],
							[randomEndList objectAtIndex:nounIndex]];
	
	NSString *randomCode = [NSString stringWithFormat:@"%@",
							[randomStartList objectAtIndex:adjectiveIndex]];
	
	float randomLatitude = (float)rand() / 100.00f;
	float randomLongitude = (float)rand() / 100.00f;
	
	Station *newStation = 
	[[[self alloc] initWithStationName: randomStationName 
						   stationCode:randomCode 
							  latitude:randomLatitude 
							 longitude:randomLongitude] autorelease];
	return newStation;
}

-(id)init
{
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

#pragma mark Dealloc

- (void)dealloc
{
	[stationName release];
	[stationCode release];
	
	[super dealloc];
}
	
@end
