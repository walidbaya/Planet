

#import "pARkViewController.h"
#import "PlaceOfInterest.h"
#import "ARView.h"


#import <CoreLocation/CoreLocation.h>

@implementation pARkViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	ARView *arView = (ARView *)self.view;

	
	// Create array of hard-coded places-of-interest, in this case some famous parks
    const char *poiNames[] = {"Soleil",
                               "Lune",
                              "Mercure",
                              "Venus",
                              "Mars",
                              "Jupiter",
                              "Saturne",
                               "Uranus",
                                "Neptune",
                                "Pluton"};
   
    NSString *poimage[]={
       @"soleil.png",
        @"lune.png",
        @"mercure.png",
        @"venus.png",
        @"mars.png",
        @"jupiter.png",
        @"saturne.png",
        @"uranus.png",
        @"neptune.png",
        @"pluton.png"
    };
	
    CLLocationCoordinate2D poiCoords[] = {{0,314.597333   },
                                          { -4.360533,132.392678},
                                          { 3.600842,305.380308 },
                                          {- 1.475222,338.590469 },
                                          { - 0.781717,347.443997},
                                          { 0.956533,138.034075 },
                                          { 1.99285,243.674886 },
                                          {- 0.640956,13.404194 },
                                          { -0.730939,336.441831 },
                                          { 2.119639,284.108067 }};
                                          
    int numPois = sizeof(poiCoords) / sizeof(CLLocationCoordinate2D);	
		
	NSMutableArray *placesOfInterest = [NSMutableArray arrayWithCapacity:numPois];
	
  
    for (int i = 0; i < numPois; i++) {
		UILabel *label = [[[UILabel alloc] init] autorelease];
		label.adjustsFontSizeToFitWidth = NO;
		label.opaque = NO;
		label.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.5f];
		label.center = CGPointMake(200.0f, 200.0f);
		label.textAlignment =  NSTextAlignmentCenter;
		label.textColor = [UIColor whiteColor];
		label.text = [NSString stringWithCString:poiNames[i] encoding:NSASCIIStringEncoding];		
		CGSize size = [label.text  sizeWithAttributes:@{NSFontAttributeName: label.font} ];
		label.bounds = CGRectMake(0.0f, 0.0f, size.width, size.height);
				
		PlaceOfInterest *poi = [PlaceOfInterest placeOfInterestWithView:label at:[[[CLLocation alloc] initWithLatitude:poiCoords[i].latitude longitude:poiCoords[i].longitude] autorelease]];
		[placesOfInterest insertObject:poi atIndex:i];
    }
    
    
for (int i = 0; i < numPois; i++) {
        
        self.img = [UIImage imageNamed:poimage[i]];
        
       
     
        self.imgView.image = self.img;
        self.imgView.contentMode= UIViewContentModeScaleAspectFill;
        self.imgView.center = self.view.center;
       
        
        PlaceOfInterest *poi = [PlaceOfInterest placeOfInterestWithView:self.imgView at:[[[CLLocation alloc] initWithLatitude:poiCoords[i].latitude longitude:poiCoords[i].longitude] autorelease]];
        [placesOfInterest insertObject:poi atIndex:i];
    }
  
	[arView setPlacesOfInterest:placesOfInterest];	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	ARView *arView = (ARView *)self.view;
	[arView start];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
	ARView *arView = (ARView *)self.view;
	[arView stop];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationPortrait;
}

- (IBAction)Home:(id)sender {
    
    self.viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"Home"];
    [self addChildViewController:_viewController];
    [self.view addSubview:_viewController.view];
}
@end
