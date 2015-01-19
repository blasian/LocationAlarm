//
//  MapViewController.m
//  LocationAlarm
//
//  Created by Michael Spearman on 1/14/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import "MapViewController.h"
#import "AlarmAnnotation.h"

@interface MapViewController ()

@property (strong, nonatomic) CLLocationManager *clm;
@property (strong, nonatomic) IBOutlet UIGestureRecognizer *tap;
@property (nonatomic) CLLocationCoordinate2D userLocation;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) MKAnnotationView *annotationView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _clm = [[CLLocationManager alloc] init];
    self.clm.delegate = self;
    self.clm.desiredAccuracy = kCLLocationAccuracyBest;
    self.clm.distanceFilter = kCLDistanceFilterNone;
    map.delegate = self;
    self.searchBar.delegate = self;
    [self.clm requestAlwaysAuthorization];
    [self.clm startUpdatingLocation];
    [map setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    [map setShowsUserLocation:YES];
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"Entered region");
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"Exited region");
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:searchBar.text
                 completionHandler:^(NSArray* placemarks, NSError* error) {
                     for (CLPlacemark *place in placemarks) {
                         AlarmAnnotation *newAlarm = [[AlarmAnnotation alloc] initWithLocation:place.location.coordinate];
                         [map addAnnotation:newAlarm];
                     }
                     
                     
//                     AlarmAnnotation *aa = [[AlarmAnnotation alloc] initWithLocation:place.location.coordinate];
//                     [map addAnnotation:aa];
//                     CLCircularRegion *cl = [[CLCircularRegion alloc] initWithCenter:place.location.coordinate radius:1000 identifier:@"alarm"];
//                     [self.clm startMonitoringForRegion:cl];
//                     MKCircle *circ = [MKCircle circleWithCenterCoordinate:place.location.coordinate radius:1000];
//                     [map addOverlay:circ];
                     
                 }
     ];
    
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKCircleRenderer *rend = [[MKCircleRenderer alloc] initWithCircle:overlay];
    [rend setStrokeColor:[UIColor blueColor]];
    return rend;
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    self.userLocation = location.coordinate;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    map.frame = self.view.bounds;
}
- (IBAction)tapped:(id)sender {
    [self.searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
