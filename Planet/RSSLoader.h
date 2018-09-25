//
//  RSSLoader.h
//  ARSSReader
//
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"
#import <UIKit/UIKit.h>
#define kRSSUrl @"http://www.nasa.gov/rss/dyn/image_of_the_day.rss"

@protocol RSSLoaderDelegate
@required
-(void)updatedFeedWithRSS:(NSArray*)items;
-(void)failedFeedUpdateWithError:(NSError*)error;
-(void)updatedFeedTitle:(NSString*)title;
@end

@interface RSSLoader : NSObject {
	UIViewController<RSSLoaderDelegate> * delegate;
	BOOL loaded;
}

@property (retain, nonatomic) UIViewController<RSSLoaderDelegate> * delegate;
@property (nonatomic, assign) BOOL loaded;

-(void)load;

@end
