    //
//  WeatherStationViewController.m
//  WeatherTracker
//
//  Created by Travis Spangle on 1/28/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import "WeatherStationViewController.h"
#import "Station.h"
#import "StationDetailViewController.h"

@implementation WeatherStationViewController

- (id)init {
	[super initWithStyle:UITableViewStyleGrouped];
	
	//Creating my stations to populate
	stations = [[NSMutableArray alloc] init];
	for(int i=0; i <10; i++) {
		[stations addObject:[Station randomStation]];
	}
	
	[[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
	[[self navigationItem] setTitle:@"Stations"];
	
	return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[[self tableView] reloadData];
}

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark -
#pragma mark Table Action Operations

- (void)setEditing:(BOOL)flag animated:(BOOL)animated
{
    [super setEditing:flag animated:animated];
    
    if (flag) {
		//Entering edit mode so add 'add' option.
        NSIndexPath *indexPath = 
		[NSIndexPath indexPathForRow:[stations count] inSection:0];
        NSArray *paths = [NSArray arrayWithObject:indexPath];
        [[self tableView] insertRowsAtIndexPaths:paths
                                withRowAnimation:UITableViewRowAnimationLeft];	
    } else {
		//Exiting edit mode so delete add option
        NSIndexPath *indexPath = 
		[NSIndexPath indexPathForRow:[stations count] inSection:0];
        NSArray *paths = [NSArray arrayWithObject:indexPath];
        [[self tableView] deleteRowsAtIndexPaths:paths 
                                withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
	int numberOfRows = [stations count];
	// If we are editing, we will have one more row than we have possessions
	if ([self isEditing])
		numberOfRows++;
	
	return numberOfRows;
}

- (void)tableView:(UITableView *)tableView 
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
	  toIndexPath:(NSIndexPath *)toIndexPath 
{
	[stations removeObjectAtIndex:[fromIndexPath row]];
	[stations insertObject:[stations objectAtIndex:[fromIndexPath row]] 
				   atIndex:[toIndexPath row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"]; 
	if (!cell)
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];	
	
	if ([indexPath row] < [stations count])
		[[cell textLabel] setText:[[stations objectAtIndex:[indexPath row]] stationName]];
	else 
		[[cell textLabel] setText:@"Add New Station..."];
	
	return cell;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView 
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{		
	if ([self isEditing] && [indexPath row] == [stations count]) {
		//Editing, add the Insert button
		return UITableViewCellEditingStyleInsert;
	}
	return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath 
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		//committing a delete command
		[stations removeObjectAtIndex:[indexPath row]];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
						 withRowAnimation:YES];
		
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
		//command was for an insert
		[stations addObject:[Station randomStation]];
		[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
						 withRowAnimation:UITableViewRowAnimationLeft];
	}
}

- (void)tableView:(UITableView *)aTableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (!detailViewController) {
		detailViewController = [[StationDetailViewController alloc] init];
	}
	
	[detailViewController setEditingStation:
	 [stations objectAtIndex:[indexPath row]]];
	
	[[self navigationController] pushViewController:detailViewController 
										   animated:YES];
}

#pragma mark -
#pragma mark Keed Add New Row at bottom
- (BOOL)tableView:(UITableView *)tableView 
canMoveRowAtIndexPath:(NSIndexPath *)indexPath 
{
	if ([indexPath row] < [stations count])
		return YES;
	return NO;
}
- (NSIndexPath *)tableView:(UITableView *)tableView 
targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath 
	   toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
	if ([proposedDestinationIndexPath row] < [stations count]) {
		return proposedDestinationIndexPath;
	}
	//User is trying to move a row beneath 'Add New '. 
	//this is not allowed
	NSIndexPath *betterIndexPath = [NSIndexPath indexPathForRow:[stations count] - 1 
													  inSection:0];
	return betterIndexPath;
}


#pragma mark -
#pragma mark Memmory Managment
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
