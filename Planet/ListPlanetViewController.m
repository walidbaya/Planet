#import "ListPlanetViewController.h"
#import "ViewController.h"

@interface ListPlanetViewController ()

@end

@implementation ListPlanetViewController
@synthesize TableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.jpg"]];
    
    self.myArray =[[NSMutableArray alloc]init];
    [self.myArray addObject:@"Sun"];
    [self.myArray addObject:@"Mercury"];
    [self.myArray addObject:@"Venus"];
    [self.myArray addObject:@"Earth"];
    [self.myArray addObject:@"Mars"];
    [self.myArray addObject:@"Jupiter"];
    [self.myArray addObject:@"Saturn"];
    [self.myArray addObject:@"Uranus"];
    [self.myArray addObject:@"Neptune"];
    [self.myArray addObject:@"Pluto"];
    
    self.imgArray =[[NSMutableArray alloc]init];
    [self.imgArray addObject:@"soleil.png"];
    [self.imgArray addObject:@"mercure.png"];
    [self.imgArray addObject:@"venus.png"];
    [self.imgArray addObject:@"globe.png"];
    [self.imgArray addObject:@"mars.png"];
    [self.imgArray addObject:@"jupiter.png"];
    [self.imgArray addObject:@"saturne.png"];
    [self.imgArray addObject:@"uranus.png"];
    [self.imgArray addObject:@"neptune.png"];
    [self.imgArray addObject:@"pluton.png"];
    
  
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.myArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier =@"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.text= [self.myArray objectAtIndex: indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[self.imgArray objectAtIndex: indexPath.row]];
    cell.detailTextLabel.text =[self.myArray objectAtIndex: indexPath.row];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    CGSize itemSize = CGSizeMake(60, 60);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
      
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    secondViewController *sv = [segue destinationViewController];
    NSIndexPath *index =[self.TableView indexPathForSelectedRow];
    [sv setStr:[self.myArray objectAtIndex:[index row]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Home:(UIBarButtonItem *)sender {
    self.viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"Home"];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [self addChildViewController:_viewController];
    [self.view addSubview:_viewController.view];
}
@end

