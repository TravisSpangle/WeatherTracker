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
}
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic, copy) NSString *stationCode;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;

+(id)randomStation;

- (id)initWithStationName:(NSString *)name
			  stationCode:(NSString *)code
				 latitude:(float)lat
				longitude:(float)lon;

@end
