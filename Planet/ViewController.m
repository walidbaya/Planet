

#import "ViewController.h"
#import "pARkViewController.h"
#import "GLView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize window;
@synthesize controller;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    [self changeBackgroundImage];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 64, 220, 50);
    [button setAutoresizingMask:UIViewAutoresizingNone];
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:@"Open Menu" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"GillSans-Light" size:30.0f];
    [button addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchDown];
    if (screenSize.height == 736){
        button.frame = CGRectMake(100, 64, 220, 50);}
    if (screenSize.height == 667){
        button.frame = CGRectMake(70, 64, 220, 50);}
    
    
    UIButton *changeBackground = [UIButton buttonWithType:UIButtonTypeCustom];
    changeBackground.frame = CGRectMake(50, 500, 220, 50);
    changeBackground.backgroundColor = [UIColor clearColor];
    [changeBackground setTitle:@"Change Background" forState:UIControlStateNormal];
    [changeBackground setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    changeBackground.titleLabel.font = [UIFont fontWithName:@"GillSans-Light" size:16.0f];
     changeBackground.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    [changeBackground addTarget:self action:@selector(changeBackgroundImage) forControlEvents:UIControlEventTouchDown];
    if (screenSize.height == 736){
        changeBackground.frame = CGRectMake(100, 650, 220, 50);}
    if (screenSize.height == 667){
        changeBackground.frame = CGRectMake(70, 570, 220, 50);}
    if (screenSize.height == 480){
        changeBackground.frame = CGRectMake(50, 430, 220, 50);}
    
    [self.view addSubview:button];
    [self.view addSubview:changeBackground];
}

- (void)showMenu {
    NSArray *items = [[NSArray alloc] initWithObjects:@"Planets", @"News", @"Position", @"3D View", @"About", nil];
    BlurMenu *menu = [[BlurMenu alloc] initWithItems:items parentView:self.view delegate:self];
    [menu show];
}


    
- (void)changeBackgroundImage {
    NSUInteger random = arc4random_uniform(6) + 1;
    NSString *backgroundImage = [NSString stringWithFormat:@"%lu.jpg", (unsigned long)random];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:backgroundImage]];
    self->bg=backgroundImage;
    NSLog(@"%@", bg);
}


#pragma mark - BlurMenu Delegate
- (void)selectedItemAtIndex:(NSInteger)index {
   // NSLog(@"Item selected at index %ld.", (long)index);
    if (index==0){
         NSLog(@"Planets");
        self.viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ListPlanetm"];
        [self addChildViewController:_viewController];
        [self.view addSubview:_viewController.view];
        
    }
    if (index==1){
        NSLog(@"RSS");
        self.viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"rssnav"];
        [self addChildViewController:_viewController];
        [self.view addSubview:_viewController.view];
    }
    if (index==2){
        NSLog(@"Position");
       
       // if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //    _viewController = [[pARkViewController alloc] initWithNibName:@"pARkViewController_iPhone" bundle:nil];
      //  } else {
       //     _viewController = [[pARkViewController alloc] initWithNibName:@"pARkViewController_iPad" bundle:nil];
        //}
        self.viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"Position"];
        [self addChildViewController:_viewController];
        [self.view addSubview:_viewController.view];
    }
    if (index==3){
        NSLog(@"Vue 3d");
        self.viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"Planet3d"];
        [self addChildViewController:_viewController];
        [self.view addSubview:_viewController.view];
       
    }
    if (index==4){
        NSLog(@"About");
        self.viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"About"];
        [self addChildViewController:_viewController];
        [self.view addSubview:_viewController.view];
    }
}

- (void)menuDidShow {
    NSLog(@"Menu appeared.");
}

- (void)menuDidHide {
    NSLog(@"Menu disappeared.");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
