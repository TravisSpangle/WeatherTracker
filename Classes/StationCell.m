//
//  StationCell.m
//  WeatherTracker
//
//  Created by Travis Spangle on 1/29/11.
//  Copyright 2011 Peak Systems. All rights reserved.
//

#import "StationCell.h"
#import "Station.h"

@implementation StationCell

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		latitudeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		longitudeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		
		latitudeLabel.textColor = [UIColor grayColor];
		longitudeLabel.textColor = [UIColor grayColor];
		
		[[self contentView] addSubview:nameLabel];
		[[self contentView] addSubview:latitudeLabel];
		[[self contentView] addSubview:longitudeLabel];
		
		[nameLabel release];
		[latitudeLabel release];
		[longitudeLabel release];
					
    }
    return self;
}

- (void)layoutSubviews {

	[super layoutSubviews];
	
	float inset = 4;
	CGRect bounds = [[self contentView] bounds];
	float firstRowHeight = (bounds.size.height / 2);
	float secondRowHeight = (bounds.size.height / 2);
	float width = bounds.size.width - 10;
	
	//CGRect innerFrame = CGRectMake(inset, inset, firstRowHeight, width - inset);
	CGRect innerFrame = CGRectMake(inset, inset, width, firstRowHeight - inset);
	[nameLabel setFrame:innerFrame];
	
	innerFrame.origin.y += (firstRowHeight - inset);
	innerFrame.size.height = secondRowHeight;
	innerFrame.size.width *= 0.50; //can only fill half of the screen
	[latitudeLabel setFrame:innerFrame];
	
	innerFrame.origin.x += innerFrame.size.width;
	[longitudeLabel setFrame:innerFrame];
	
}

-(void) setStation:(Station *)station {
	
	[nameLabel setText:
	 [NSString stringWithFormat:@"%@", [station stationName]]];
	[latitudeLabel setText:
	 [NSString stringWithFormat:@"Latitude: %f", [station latitude]]];
	[longitudeLabel setText:
	 [NSString stringWithFormat:@"Longitude: %f", [station longitude]]];
	
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
