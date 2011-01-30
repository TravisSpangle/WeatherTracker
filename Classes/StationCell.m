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
	
	float inset = 5;
	CGRect bounds = [[self contentView] bounds];
	float firstRowHeight = (bounds.size.height * 0.70);
	float secondRowHeight = (bounds.size.height * 0.30);
	float width = bounds.size.width;
	
	CGRect innerFrame = CGRectMake(inset, inset, firstRowHeight, width - inset);
	[nameLabel setFrame:innerFrame];
	
	innerFrame.origin.y += firstRowHeight + inset;
	innerFrame.size.height = secondRowHeight;
	innerFrame.size.width *= 0.50; //can only fill half of the screen
	[latitudeLabel setFrame:innerFrame];
	
	innerFrame.origin.x += innerFrame.size.width;
	[longitudeLabel setFrame:innerFrame];
	
	// Move that rectangle over and resize the width for the nameLabel
	/*innerFrame.origin.x += innerFrame.size.width + inset;
	innerFrame.size.width = w - (h + valueWidth + inset * 4);
	[nameLabel setFrame:innerFrame];
	
	// Move that rectangle over again and resize the width for valueLabel
	innerFrame.origin.x += innerFrame.size.width + inset;
	innerFrame.size.width = valueWidth;
	[valueLabel setFrame:innerFrame];
	 */
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
