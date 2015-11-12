//
//  ViewController.m
//  LocationServices
//
//  Created by ShikshaPC-41 on 03/11/15.
//  Copyright (c) 2015 AnshTech. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

//@import GoogleMaps;

@interface ViewController ()<GMSMapViewDelegate>


@end

@implementation ViewController{
    GMSMapView *mapView;
    //BOOL firstLocationUpdate_;
}

- (void)viewDidLoad {
   
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:12.971599
                                                            longitude:77.594563
                                                                 zoom:10];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];

    //UIEdgeInsets mapInsets = UIEdgeInsetsMake(0.0, 60.0, 320.0, 400.0);
   // mapView.padding = mapInsets;
   // [mapView addObserver:self
   //            forKeyPath:@"myLocation"
   //               options:NSKeyValueObservingOptionNew
   //               context:NULL];
    mapView.accessibilityElementsHidden = NO;
    mapView.myLocationEnabled = YES;
    mapView.settings.myLocationButton = YES;
    self.view = mapView;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(12.971599, 77.594563);
    marker.title = @"Bangalore";
    marker.snippet = @"India";
    marker.map = mapView;
}


#pragma mark - MapViewDelegate

- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
}

//- (void)dealloc {
//    [mapView removeObserver:self
//                  forKeyPath:@"myLocation"
//                     context:NULL];
//}

//#pragma mark - KVO updates
//
//- (void)observeValueForKeyPath:(NSString *)keyPath
//                      ofObject:(id)object
//                        change:(NSDictionary *)change
//                       context:(void *)context {
//    if (!firstLocationUpdate_) {
//
//        firstLocationUpdate_ = YES;
//        CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
//        mapView.camera = [GMSCameraPosition cameraWithTarget:location.coordinate
//                                                         zoom:14];
//    }
//}


//-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
//{
//    [mapView animateToLocation:newLocation.coordinate];
//    // some code...
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
