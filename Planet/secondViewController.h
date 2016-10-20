//
//  secondViewController.h
//  Tableview
//
//  Created by Baya Walid on 29/01/2015.
//  Copyright (c) 2015 Baya Walid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface secondViewController : UIViewController
{
    
     NSString* str;
     NSString *soleiltxt;
    NSString *mercuretxt;
    NSString *venustxt;
   NSString *terretxt;
     NSString *marstxt;
     NSString *jupitertxt;
     NSString *saturnetxt;
     NSString *uranustxt;
     NSString *neptunetxt;
    NSString *plutontxt;
    UILabel *myLabel;
    UIImageView *img;
    UITextView *desc;
    
}
@property (nonatomic,weak) IBOutlet UILabel *myLabel;
@property (nonatomic,weak) NSString* str;
@property (nonatomic,weak) NSString *soleiltxt;
@property (nonatomic,weak) NSString *mercuretxt;
@property (nonatomic,weak) NSString *venustxt;
@property (nonatomic,weak) NSString *terretxt;
@property (nonatomic,weak) NSString *marstxt;
@property (nonatomic,weak) NSString *jupitertxt;
@property (nonatomic,weak) NSString *saturnetxt;
@property (nonatomic,weak) NSString *uranustxt;
@property (nonatomic,weak) NSString *neptunetxt;
@property (nonatomic,weak) NSString *plutontxt;


@property (weak, nonatomic) IBOutlet UIImageView *img;

@property (weak, nonatomic) IBOutlet UITextView *desc;


@end
