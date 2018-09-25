

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PlaceOfInterest : NSObject

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) CLLocation *location;


+ (PlaceOfInterest *)placeOfInterestWithView:(UIView *)view at:(CLLocation *)location;

@end
