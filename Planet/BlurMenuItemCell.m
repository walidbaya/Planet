//
//  BlurMenuItemCell.m
//  BlurMenu
//
//

#import "BlurMenuItemCell.h"

@implementation BlurMenuItemCell
@synthesize title;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        title = [[UILabel alloc] initWithFrame:self.contentView.frame];
        title.backgroundColor = [UIColor clearColor];
        title.font = [UIFont fontWithName:@"GillSans-Light" size:25.0f];
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor whiteColor];
        title.adjustsFontSizeToFitWidth = YES;
        
        /*UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [title addGestureRecognizer:tapGestureRecognizer];
        title.userInteractionEnabled = YES;*/
        
        [self.contentView addSubview:title];
    }
    return self;
}

-(void)labelTapped:(UILabel *)myLabel
{
    // do your stuff;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
