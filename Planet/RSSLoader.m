//
//  RSSLoader.m
//  ARSSReader
//
//

#import "RSSLoader.h"

@interface RSSLoader (Private)

-(void)dispatchLoadingOperation;
-(NSDictionary*)getItemFromXmlElement:(GDataXMLElement*)xmlItem;

@end


@implementation RSSLoader

@synthesize delegate, loaded;

-(id)init
{
	if ([super init]!=nil) {
		self.loaded = NO;
	}
	return self;
}

-(void)load
{
	[self dispatchLoadingOperation];
}


-(void)dispatchLoadingOperation
{
	NSOperationQueue *queue = [NSOperationQueue new];
	
	NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
																			selector:@selector(fetchRss)
																			  object:nil];
	
	[queue addOperation:operation];
	
}

-(void)fetchRss
{	
	NSLog(@"fetch rss");
	NSData* xmlData = [[NSMutableData alloc] initWithContentsOfURL:[NSURL URLWithString: kRSSUrl] ];
    NSError *error;
	
    GDataXMLDocument* doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
	
	if (doc != nil) {
		self.loaded = YES;
		
		GDataXMLNode* title = [[[doc rootElement] nodesForXPath:@"channel/title" error:&error] objectAtIndex:0];
		[self.delegate updatedFeedTitle: [title stringValue] ];
		
		NSArray* items = [[doc rootElement] nodesForXPath:@"channel/item" error:&error];
		NSMutableArray* rssItems = [NSMutableArray arrayWithCapacity:[items count] ];
		
		for (GDataXMLElement* xmlItem in items) {
			[rssItems addObject: [self getItemFromXmlElement:xmlItem] ];
		}
		
		[self.delegate performSelectorOnMainThread:@selector(updatedFeedWithRSS:) withObject:rssItems waitUntilDone:YES];
	} else {
		[self.delegate performSelectorOnMainThread:@selector(failedFeedUpdateWithError:) withObject:error waitUntilDone:YES];
	}
}

-(NSDictionary*)getItemFromXmlElement:(GDataXMLElement*)xmlItem
{
	return [NSDictionary dictionaryWithObjectsAndKeys:
						  [[[xmlItem elementsForName:@"title"] objectAtIndex:0] stringValue], @"title",
                          [[[xmlItem elementsForName:@"pubDate"] objectAtIndex:0] stringValue], @"pubDate",
						  [[[[xmlItem elementsForName:@"enclosure"] objectAtIndex:0] attributeForName:@"url"]stringValue] , @"enclosure",
						  [[[xmlItem elementsForName:@"description"] objectAtIndex:0] stringValue], @"description",
						  nil];
}

@end
