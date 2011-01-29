//
//  WeatherStationViewController.h
//  WeatherTracker
//
//  Created by Travis Spangle on 1/28/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StationDetailViewController;

@interface WeatherStationViewController : UITableViewController {
	StationDetailViewController *detailViewController;
	
	NSMutableArray *stations;
}

@end
