//
//  ViewController.h
//  BlurMenu
//
//  Created by Ali Yılmaz on 05/02/14.
//  Copyright (c) 2014 Ali Yılmaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <foundation/Foundation.h>
#import "BlurMenu.h"

@interface ViewController : UIViewController <BlurMenuDelegate>
{
    NSString *bg;
}
@property (strong,nonatomic)UIViewController *viewController;

@end
