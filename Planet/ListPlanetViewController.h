//
//  ListPlanetViewController.h
//  BlurMenu
//
//  Created by Baya Walid on 18/02/2015.
//  Copyright (c) 2015 Ali Yılmaz. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController.h"
#import "secondViewController.h"

@interface ListPlanetViewController : UIViewController <UITableViewDelegate , UITableViewDataSource>
{
    UITableView *TableView;
    ViewController *vc;
        
}

- (IBAction)Home:(UIBarButtonItem *)sender;

@property (strong,nonatomic)UIViewController *viewController;


@property (weak, nonatomic) IBOutlet UITableView *TableView;

@property (nonatomic,strong) NSMutableArray *myArray;
@property (nonatomic,strong) NSMutableArray *imgArray;

@end

