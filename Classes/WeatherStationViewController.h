//
//  WeatherStationViewController.h
//  WeatherTracker
//
//  Created by Travis Spangle on 1/28/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WeatherStationViewController : UITableViewController {
	UIView *headerView;
	NSMutableArray *stations;
}
- (UIView *)headerView;
@end
