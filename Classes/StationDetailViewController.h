//
//  StationDetailViewController.h
//  WeatherTracker
//
//  Created by Travis Spangle on 1/28/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Station;

@interface StationDetailViewController : UIViewController {
	IBOutlet UITextField *stationNameField;
	IBOutlet UITextField *stationCodeField;
	IBOutlet UITextField *latitude;
	IBOutlet UITextField *longitude;
	
	Station *editingStation;
}
@property (nonatomic, assign) Station *editingStation;
@end
