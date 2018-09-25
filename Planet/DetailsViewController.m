//
//  DetailsViewController.m
//  ARSSReader
//
//

#import "DetailsViewController.h"


@implementation DetailsViewController

@synthesize item;
@synthesize lbl_title;
@synthesize lbl_datePub;
@synthesize txt_desc;
@synthesize txtTitle;
@synthesize txtUrlImage;
@synthesize txtpubDate;
@synthesize txtDescription;
@synthesize imgArticle;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.lbl_title.text=   [item objectForKey:@"title"];
    self.lbl_datePub.text = [item objectForKey:@"pubDate"];
    self.txt_desc.text = [item objectForKey:@"description"];
self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.jpg"]];
    
    NSURL *url = [NSURL URLWithString:  [item objectForKey:@"enclosure"]];
    NSData * data= [[NSData alloc] initWithContentsOfURL:url];
    UIImage * tmpImage = [[UIImage alloc]initWithData:data];
    
    self.imgArticle.image=tmpImage;
    
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}



@end
