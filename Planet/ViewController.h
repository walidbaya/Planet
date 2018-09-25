//
//  ViewController.h
//  BlurMenu
//
//  Created by Ali Yılmaz on 05/02/14.
//

#import <UIKit/UIKit.h>
#import <foundation/Foundation.h>
#import "GLViewController.h"
#import "BlurMenu.h"

@interface ViewController : UIViewController <BlurMenuDelegate>
{
    UIWindow				*window;
    GLViewController		*controller;
    NSString *bg;
}
@property (strong,nonatomic)UIViewController *viewController;
@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet GLViewController *controller;
@end
