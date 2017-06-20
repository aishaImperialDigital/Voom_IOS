//
//  VoomMapView.m
//  Voom
//
//  Created by gqgnju on 20/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomMapView.h"

@implementation VoomMapView
{
    GMSMarker *_sydneyMarker;
    GMSMarker *_melbourneMarker;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-37.81969
                                                                longitude:144.966085
                                                                     zoom:4];
        GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        
        _sydneyMarker = [[GMSMarker alloc] init];
        _sydneyMarker.title = @"Sydney";
        _sydneyMarker.snippet = @"Population: 4,605,992";
        _sydneyMarker.position = CLLocationCoordinate2DMake(-33.8683, 151.2086);
        _sydneyMarker.flat = NO;
        _sydneyMarker.rotation = 30.0;
        NSLog(@"sydneyMarker: %@", _sydneyMarker);
        
        GMSMarker *australiaMarker = [[GMSMarker alloc] init];
        australiaMarker.title = @"Australia";
        australiaMarker.position = CLLocationCoordinate2DMake(-27.994401,140.07019);
        australiaMarker.appearAnimation = kGMSMarkerAnimationPop;
        australiaMarker.flat = YES;
        australiaMarker.draggable = YES;
        australiaMarker.groundAnchor = CGPointMake(0.5, 0.5);
        australiaMarker.icon = [UIImage imageNamed:@"australia"];
        australiaMarker.map = mapView;
        
        // Set the marker in Sydney to be selected
        mapView.selectedMarker = _sydneyMarker;
        [self addSubview:mapView];
       
    }
    return self;
}

-(void) awakeFromNib
{
    [super awakeFromNib];
}


@end
