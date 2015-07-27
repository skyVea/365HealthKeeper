//
//  MapViewController.m
//  365HealthKeeper
//
//  Created by lanou3g on 15/7/27.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MapViewController.h"
#import "MapView.h"
@interface MapViewController ()<MKMapViewDelegate>
@property (strong,nonatomic)MKMapView *mapView;

@end

@implementation MapViewController

- (void)loadView
{
    self.mapView = [[MKMapView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _mapView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 开始定位用户的位置
    [self.locMgr startUpdatingLocation];
    
    // 1.跟踪用户位置(显示用户的具体位置)
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    // 2.设置地图类型
    self.mapView.mapType = MKMapTypeStandard;
    
    // 3.设置代理
    self.mapView.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 地图Map

- (CLLocationManager *)locMgr
{
#warning 定位服务不可用
    if(![CLLocationManager locationServicesEnabled]) return nil;
    
    if (!_locMgr) {
        // 创建定位管理者
        self.locMgr = [[CLLocationManager alloc] init];
        // 设置代理
        self.locMgr.delegate = self;
    }
    return _locMgr;
}



#pragma mark - CLLocationManagerDelegate
/**
 *  只要定位到用户的位置，就会调用（调用频率特别高）
 *  @param locations : 装着CLLocation对象
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //CLLocation中存放的是一些经纬度, 速度等信息. 要获取地理位置需要转换做地理位置编码.
    // 1.取出位置对象
    CLLocation *loc = [locations firstObject];
    
    NSLog(@"CLLocation----%@",loc);
    
    // 2.取出经纬度
    CLLocationCoordinate2D coordinate = loc.coordinate;
    
    // 3.打印经纬度
    NSLog(@"didUpdateLocations------%f %f", coordinate.latitude, coordinate.longitude);
    
    // 停止定位(省电措施：只要不想用定位服务，就马上停止定位服务)
    [manager stopUpdatingLocation];
}


#pragma mark - MKMapViewDelegate
/**
 *  当用户的位置更新，就会调用
 *
 *  @param userLocation 表示地图上蓝色那颗大头针的数据
 */
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    userLocation.title = @"苍老师在这里";
    userLocation.subtitle = @"苍老师在这里，你知道吗？";
    
    CLLocationCoordinate2D center = userLocation.location.coordinate;
    NSLog(@"%f %f", center.latitude, center.longitude);
    
    // 设置地图的显示范围, 让其显示到当前指定的位置
    MKCoordinateSpan span = MKCoordinateSpanMake(0.021321, 0.019366);//这个显示大小精度自己调整
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    [mapView setRegion:region animated:YES];
}

@end
