//
//  StationDetailViewController.m
//  WeatherTracker
//
//  Created by Travis Spangle on 1/28/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import "StationDetailViewController.h"
#import "Station.h"

@implementation StationDetailViewController

@synthesize editingStation;


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	// Use properties of incoming possession to change user interface
	[stationNameField setText:[editingStation stationName]];
	[stationCodeField setText:[editingStation stationCode]];
	[latitude setText:[NSString stringWithFormat:@"%f",[editingStation latitude]]];
	[longitude setText:[NSString stringWithFormat:@"%f",[editingStation longitude]]];
	
	// Change the nav item to display name of possession
	[[self navigationItem] setTitle:[editingStation stationName]];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];	
	
	[stationNameField resignFirstResponder];
	[stationCodeField resignFirstResponder];
	[latitude resignFirstResponder];
	[longitude resignFirstResponder];
    
	//Saving Changes
	[editingStation setStationName:[stationNameField text]];
	[editingStation setStationCode:[stationCodeField text]];
	[editingStation setLatitude:[[latitude text] floatValue]];
	[editingStation setLongitude:[[longitude text] floatValue]];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];

	[stationNameField release];
	stationCodeField = nil;
	
	[stationCodeField release];
	stationCodeField = nil;
	
	[latitude release];
	latitude = nil;
	
	[longitude release];
	longitude = nil;
}


- (void)dealloc {
	[stationNameField release];
	[stationCodeField release];	
	[latitude release];
	[longitude release];
    [super dealloc];
}


@end
