//
//  TableHeaderView.m
//  ARSSReader
//
//

#import "TableHeaderView.h"


@implementation TableHeaderView

- (id)initWithText:(NSString*)text 
{
	UIImage* img2 = [UIImage imageNamed:@"arss_header.png"];
    if ((self = [super initWithImage:img2])) {
        // Initialization code
		label = [[UILabel alloc] initWithFrame:CGRectMake(20,10,200,70)];
		label.textColor = [UIColor whiteColor];
		label.shadowColor = [UIColor grayColor];
		label.shadowOffset = CGSizeMake(1, 1);
		label.backgroundColor = [UIColor clearColor];
		label.font = [UIFont systemFontOfSize:20];
		label.text = text;
		label.numberOfLines = 2;
		[self addSubview:label];
    }
    return self;
}

- (void)setText:(NSString*)text
{
	label.text = text;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
