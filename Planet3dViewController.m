//
//  Planet3dViewController.m
//  Planet
//
//  Created by Baya Walid on 11/04/2015.
//
//

#import "Planet3dViewController.h"
#import "GLViewController.h"
#import "GLView.h"

@interface Planet3dViewController ()

@end

@implementation Planet3dViewController
@synthesize controller;
@synthesize window;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"render.jpg"]];
    
    CGRect	rect = [[UIScreen mainScreen] bounds];
    
    window.frame = rect;
    
    GLViewController *theController = [[GLViewController alloc] init];
    self.controller = theController;
    
    
    GLView *glView = [[GLView alloc] initWithFrame:rect];
    [self.window addSubview:glView];
    
    
    theController.view = glView;
    
    glView.controller = controller;
    glView.animationInterval = 1.0 / kRenderingFrequency;
    [glView startAnimation];
    
    glView.layer.contentsScale = [UIScreen mainScreen].scale;
    self.window.backgroundColor =[UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(Home:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Home" forState:UIControlStateNormal];
    button.frame = CGRectMake(2.0, 20.0, 60.0, 40.0);
    [window addSubview:button];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Home:(id)sender {
    
    self.viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"Home"];
    [self addChildViewController:_viewController];
    [self.view addSubview:_viewController.view];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
