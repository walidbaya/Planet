//
//  RootViewController.m
//  ARSSReader
//
//

#import "RootViewController.h"
#import "UIImageView+WebCache.h"


@implementation RootViewController
@synthesize tabView;
#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.title = @"NASA NEWS";
	rssItems = nil;
	rss = nil;

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.jpg"]];

	//self.tabView.tableHeaderView = [[TableHeaderView alloc] initWithText:@"NASA Image of day RSS"];
	
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	
	if (rss==nil) {
		rss = [[RSSLoader alloc] init];
		rss.delegate = self;
		[rss load];
	}
}

#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (rss.loaded == YES) {
		return [rssItems count];
	} else {
		return 1;
	}
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	
    static NSString *CellIdentifier = @"cellrss";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	NSDictionary* item = [rssItems objectAtIndex: indexPath.row];
    
	cell.backgroundColor=[UIColor clearColor];
    
    //cell.detailTextLabel.text = [item objectForKey:@"description"];
	
    //cell.textLabel.text = [item objectForKey:@"title"];
   
   // NSURL *url = [NSURL URLWithString:  [item objectForKey:@"enclosure"]];
    //NSData * data= [[NSData alloc] initWithContentsOfURL:url];
    CGSize itemSize = CGSizeMake(60, 60);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    
    
    
    //UIImage * tmpImage = [[UIImage alloc]initWithData:data];
   // cell.imageView.image=tmpImage;
    
    
    UILabel *lbltitle = (UILabel *)[cell.contentView viewWithTag:1];
    lbltitle.text = [item objectForKey:@"title"];
    UIImageView *lbImg = (UIImageView *)[cell.contentView viewWithTag:3];
    //lbImg.image =tmpImage;
    [lbImg sd_setImageWithURL:[NSURL URLWithString:  [item objectForKey:@"enclosure"]]
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]];

    UILabel *lbldate = (UILabel *)[cell.contentView viewWithTag:2];
    lbldate.text = [item objectForKey:@"pubDate"];
    return cell;
}




#pragma mark -
#pragma mark Table view delegate



#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailsViewController *sv = [segue destinationViewController];
    NSIndexPath *index =[self.tabView indexPathForSelectedRow];
     NSLog(@"%d", index.row);
    NSDictionary* item = [rssItems objectAtIndex: index.row];
    [sv setItem:item];

}



#pragma mark -
#pragma mark RSSLoaderDelegate
-(void)updatedFeedWithRSS:(NSMutableArray*)items
{
	rssItems = items ;
	[self.tabView reloadData];
}

-(void)failedFeedUpdateWithError:(NSError *)error
{
	//
}

-(void)updatedFeedTitle:(NSString*)rssTitle
{
	[(TableHeaderView*)self.tabView.tableHeaderView setText:rssTitle];
}
- (IBAction)Home:(UIBarButtonItem *)sender {
    self.viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"Home"];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [self addChildViewController:_viewController];
    [self.view addSubview:_viewController.view];
}
@end
