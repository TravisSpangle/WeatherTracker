//
//  StationCell.h
//  WeatherTracker
//
//  Created by Travis Spangle on 1/29/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Station;

@interface StationCell : UITableViewCell {

	UILabel *nameLabel;
	UILabel *latitudeLabel;
	UILabel *longitudeLabel;
}
- (void)setStation:(Station *)station;
@end
