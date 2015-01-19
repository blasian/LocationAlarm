//
//  AlarmAnnotation.h
//  LocationAlarm
//
//  Created by Michael Spearman on 1/16/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface AlarmAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, readonly, copy) NSString *title;
@property CLLocationDistance radius;
// 0 = offAlways, 1 = onEnter, 2 = onExit, 3 = onAlways
@property int alertStatus;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithLocation:(CLLocationCoordinate2D)coord;

@end
