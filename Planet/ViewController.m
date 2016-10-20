//
//  ViewController.m
//  BlurMenu
//
//  Created by Ali Yılmaz on 05/02/14.
//  Copyright (c) 2014 Ali Yılmaz. All rights reserved.
//

#import "ViewController.h"
#import "pARkViewController.h"
#import "CoolUnitySceneViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self changeBackgroundImage];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 64, 220, 50);
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:@"Open Menu" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"GillSans-Light" size:30.0f];
    [button addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchDown];
    
    UIButton *changeBackground = [UIButton buttonWithType:UIButtonTypeCustom];
    changeBackground.frame = CGRectMake(50, 500, 220, 50);
    changeBackground.backgroundColor = [UIColor clearColor];
    [changeBackground setTitle:@"Change Background" forState:UIControlStateNormal];
    [changeBackground setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   
    changeBackground.titleLabel.font = [UIFont fontWithName:@"GillSans-Light" size:16.0f];
     changeBackground.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    [changeBackground addTarget:self action:@selector(changeBackgroundImage) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:button];
    [self.view addSubview:changeBackground];
}

- (void)showMenu {
    NSArray *items = [[NSArray alloc] initWithObjects:@"Planetes", @"News", @"Position", @"Vue 3d", @"About", nil];
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
        self.viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"startUnity"];
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
