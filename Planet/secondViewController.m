//
//  secondViewController.m
//  Tableview
//
//  Created by Baya Walid on 29/01/2015.
//  Copyright (c) 2015 Baya Walid. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

@synthesize str;
@synthesize soleiltxt;
@synthesize mercuretxt;
@synthesize venustxt;
@synthesize terretxt;
@synthesize marstxt;
@synthesize jupitertxt;
@synthesize saturnetxt;
@synthesize uranustxt;
@synthesize neptunetxt;
@synthesize plutontxt;
@synthesize myLabel;
@synthesize desc;
@synthesize img;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.jpg"]];

   
    self.soleiltxt=@"The sun is a star. It is also the only star of our solar system. All the planets of the solar system revolve around the sun. The Sun's mission is to shine and emit energy in order to maintain consistency between all the planets that revolve around it. It offers 365 days traveling the zodiac sign and 30 days (a sign is 30 degrees). He advances one degree per day environ.Distance earth: 150 million km.Masse 334,000 times the sun at terre.Temperature center: 15 million degrees.";
   
    self.mercuretxt=@"Very close to the sun we find Mercury that always accompanies the Sun in its course. Mercury's surface is covered with craters that are the impacts of meteorites that crashed into the planet.";
    
    self.venustxt=@"Venus is the 2nd solar system planets. The Magellan probe revealed that the surface is from hot desert including craters, volcanoes and mountains.";
    
    self.terretxt=@"Earth is the only planet where life is possible. Life on Earth appeared there 3 Billion .L'atmosphère years from Earth captures heat and sunlight necessary for the development of life but stops ultraviolet rays that are harmful to living beings. The atmosphere contains oxygen without which we can not breathe.";
    
    self.marstxt=@"Outside the Earth's orbit is the first encounter Mars, the red planet, planet of action Mars is the fourth planet in the solar system. This is the last planet tellurgique, the following planets are gas planets (except Pluto) March is characterized by its red color is due to the presence of iron oxide in the dust from its surface.";
    
    self.jupitertxt=@"Jupiter is the first planet slow, the largest of the solar system, 12fois above the Earth. Surrounded by dozens of satellites, it produces its own energy.";
    
    self.saturnetxt=@"Almost as large as Jupiter. Saturn is known by his ring formed mostly of dust and ice. Despite its size Saturn is so light it could float on water. Saturn is the 6th planet from the Sun is a gas giant planet.";
    
    self.uranustxt=@"Uranus was discovered by musician William Herschel in 1781. The planet consists of three layers: a core made of molten rock, a layer made of ice, ammonia and methane solid and consists of liquid hydrogen layer. It is the presence of methane in the atmosphere gives the planet its blue-green color.";
    
    self.neptunetxt=@"Beautiful blue planet. Neptune was discovered in 1846. It has a rocky core surrounded by an ocean of methane, ammonia and water. Its blue color is due to the presence of methane in the atmosphere: the red is absorbed and scattered blue.";
    
    self.plutontxt=@"(Since 24 August 2006, Pluto is no longer considered a planet in the solar system). Pluto is about six billion kilometers from the sun. It is the smallest planet; it is smaller than the moon.";
    
    
    
    self.myLabel.text = self.str;
    if([self.str isEqualToString:@"Sun"]){
        [img setImage :[UIImage  imageNamed:@"soleil"]];
        desc.text=self.soleiltxt;
    }
    if([self.str isEqualToString:@"Mercury"]){
        [img setImage :[UIImage imageNamed:@"mercure"]];
          desc.text=self.mercuretxt;
        
    }
    if([self.str isEqualToString:@"Venus"]){
        [img setImage :[UIImage imageNamed:@"venus"]];
          desc.text=self.venustxt;
        
    }
    if([self.str isEqualToString:@"Earth"]){
        [img setImage :[UIImage imageNamed:@"globe"]];
          desc.text=self.terretxt;
        
    }
    if([self.str isEqualToString:@"Mars"]){
        [img setImage :[UIImage imageNamed:@"mars"]];
                  desc.text=self.marstxt;
        
    }
    if([self.str isEqualToString:@"Jupiter"]){
        [img setImage :[UIImage imageNamed:@"jupiter"]];
                  desc.text=self.jupitertxt;
        
    }
    if([self.str isEqualToString:@"Saturn"]){
        [img setImage :[UIImage imageNamed:@"saturne"]];
                  desc.text=self.saturnetxt;
        
    }
    if([self.str isEqualToString:@"Uranus"]){
        [img setImage :[UIImage imageNamed:@"uranus"]];
                  desc.text=self.uranustxt;
        
    }
    if([self.str isEqualToString:@"Neptune"]){
        [img setImage :[UIImage imageNamed:@"neptune"]];
                  desc.text=self.neptunetxt;
        
    }
    if([self.str isEqualToString:@"Pluto"]){
        [img setImage :[UIImage imageNamed:@"pluton"]];
                  desc.text=self.plutontxt;
        
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
