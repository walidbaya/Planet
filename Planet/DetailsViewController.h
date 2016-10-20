//
//  DetailsViewController.h
//  ARSSReader
//
//  Created by Marin Todorov on 5/25/10.
//  Copyright 2010 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailsViewController : UIViewController <UIWebViewDelegate> {
	NSDictionary* item;

    
    NSString * txtTitle;
    NSString * txtUrlImage;
    NSString * txtpubDate;
    NSString * txtDescription;
    
    
    IBOutlet UILabel *lbl_title;
    
    IBOutlet UILabel *lbl_datePub;
    IBOutlet UITextView *txt_desc;
    IBOutlet UIImageView *imgArticle;
	IBOutlet UIActivityIndicatorView* loader;
}

@property (nonatomic,weak) NSString* txtTitle;
@property (nonatomic,weak) NSString* txtUrlImage;
@property (nonatomic,weak) NSString* txtpubDate;
@property (nonatomic,weak) NSString* txtDescription;
@property (retain, nonatomic) NSDictionary* item;
@property(retain,nonatomic) UILabel*lbl_title;
@property(retain,nonatomic) UIImageView*imgArticle;
@property(retain,nonatomic) UILabel*lbl_datePub;
@property(retain,nonatomic) UITextView*txt_desc;


@end
