//
//  MapViewController.h
//  365HealthKeeper
//
//  Created by lanou3g on 15/7/27.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface MapViewController : UIViewController<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locMgr;
@end
