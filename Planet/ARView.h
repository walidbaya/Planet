

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "pARkViewController.h"
#import <CoreMotion/CoreMotion.h>


@interface ARView : UIView  <CLLocationManagerDelegate> {
}

@property (nonatomic, retain) NSArray *placesOfInterest;

- (IBAction)Home:(id)sender;

@property (strong,nonatomic)UIViewController *viewController;
- (IBAction)btnFlashOnClicked:(id)sender;
@property(strong,nonatomic) pARkViewController *parkview;
@property (strong,nonatomic)UIView *view;

- (void)start;
- (void)stop;

@end
