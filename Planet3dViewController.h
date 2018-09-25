//
//  Planet3dViewController.h
//  Planet
//
//  Created by Baya Walid on 11/04/2015.
//
//
#import "GLViewController.h"
#import <UIKit/UIKit.h>

@interface Planet3dViewController : UIViewController
{
    UIWindow				*window;
    GLViewController		*controller;
}

@property (strong,nonatomic)UIViewController *viewController;
@property (nonatomic, strong) GLViewController *controller;
@property (strong, nonatomic) IBOutlet UIWindow *window;
@end
