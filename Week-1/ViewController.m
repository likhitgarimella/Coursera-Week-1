//
//  ViewController.m
//  Week-1
//
//  Created by Priya Singh on 16/04/21.
//

#import "MapKit/MapKit.h"
#import "WebKit/WebKit.h"
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property (weak, nonatomic) IBOutlet WKWebView *myWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *webURL = @"https://github.com/priya-singh-28";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:webURL]];
    [self.myWebView loadRequest:request];
    
    double latitude = 28.704060;
    double longitude = 77.102493;
    
    MKPointAnnotation *wAnno = [[MKPointAnnotation alloc] init];
    wAnno.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    wAnno.title = @"Priya Singh";
    
    [self.myMapView addAnnotation:wAnno];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(wAnno.coordinate, 1000, 1000);
    MKCoordinateRegion adjusted = [self.myMapView regionThatFits:region];
    [self.myMapView setRegion: adjusted animated: YES];
    
}

@end    // #44
