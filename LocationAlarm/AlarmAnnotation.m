//
//  AlarmAnnotation.m
//  LocationAlarm
//
//  Created by Michael Spearman on 1/16/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import "AlarmAnnotation.h"

@implementation AlarmAnnotation
@synthesize coordinate;
@synthesize title;
@synthesize radius;
@synthesize alertStatus;

-(id)initWithLocation:(CLLocationCoordinate2D)coord  {
    self = [super init];
    if (self) {
        coordinate = coord;
        alertStatus = 3;
    }
    return self;
}

@end
