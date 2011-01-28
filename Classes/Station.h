//
//  Station.h
//  RandomStation
//
//  Created by Travis Spangle on 01/28/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Station : NSObject {
	NSString *stationName;
	NSString *stationCode;
	float latitude;
	float longitude;
	
	/*NSString *possessionName;
	NSString *serialNumber;
	int valueInDollars;
	NSDate *dateCreated;*/
}
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic, copy) NSString *stationCode;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;

/*@property (nonatomic, copy) NSString *possessionName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;*/

+(id)randomStation;

/*- (id)initWithPossessionName:(NSString *)name
			  valueInDollars:(int)value
				serialNumber:(NSString *)sNumber;*/

- (id)initWithStationName:(NSString *)name
			  stationCode:(NSString *)code
				 latitude:(float)lat
				longitude:(float)lon;

@end
