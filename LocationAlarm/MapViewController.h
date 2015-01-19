//
//  MapViewController.h
//  LocationAlarm
//
//  Created by Michael Spearman on 1/14/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UISearchBarDelegate>
{
    IBOutlet MKMapView *map;
}
@end
