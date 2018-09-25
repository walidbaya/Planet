//
//  DetailsViewController.h
//  ARSSReader
//
//

#import <UIKit/UIKit.h>


@interface DetailsViewController : UIViewController <UIWebViewDelegate> {
	NSDictionary* item;

  
    
    IBOutlet UILabel *lbl_title;
    
    IBOutlet UILabel *lbl_datePub;
    IBOutlet UITextView *txt_desc;
    IBOutlet UIImageView *imgArticle;
	IBOutlet UIActivityIndicatorView* loader;
}

@property (nonatomic,strong) NSString* txtTitle;
@property (nonatomic,weak) NSString* txtUrlImage;
@property (nonatomic,weak) NSString* txtpubDate;
@property (nonatomic,weak) NSString* txtDescription;
@property (retain, nonatomic) NSDictionary* item;
@property(retain,nonatomic) UILabel*lbl_title;
@property(retain,nonatomic) UIImageView*imgArticle;
@property(retain,nonatomic) UILabel*lbl_datePub;
@property(retain,nonatomic) UITextView*txt_desc;


@end
