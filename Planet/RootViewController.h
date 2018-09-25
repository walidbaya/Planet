//
//  RootViewController.h
//  ARSSReader
//
//

#import <UIKit/UIKit.h>
#import "RSSLoader.h"
#import "DetailsViewController.h"
#import "TableHeaderView.h"

@interface RootViewController :

UIViewController <UITableViewDelegate , UITableViewDataSource, RSSLoaderDelegate>
{
	RSSLoader* rss;
	NSMutableArray* rssItems;
}
@property (weak, nonatomic) IBOutlet UITableView *tabView;
- (IBAction)Home:(UIBarButtonItem *)sender;
@property (strong,nonatomic)UIViewController *viewController;
@end
