//
//  WeatherTrackerAppDelegate.h
//  WeatherTracker
//
//  Created by Travis Spangle on 1/28/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeatherStationViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	WeatherStationViewController *weatherStationViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

