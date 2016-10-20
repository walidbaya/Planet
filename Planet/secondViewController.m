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

   
    self.soleiltxt=@"Le soleil est une étoile. C’est aussi la seule étoile de notre système solaire. Toutes les planètes du système solaire tournent autour du Soleil. Le Soleil a pour mission de briller et d’émettre de l’énergie, afin de maintenir une cohérence entre toutes les planètes qui gravitent autour de lui. Il met 365 jours à parcourir le zodiaque et 30 jours un signe (un signe fait 30 degrés). Il avance d’un degré par jour environ.Distance à la terre : 150 millions de km.Masse 334 000 fois de la terre.Température au centre du soleil : 15 millions de degrés.";
   
    self.mercuretxt=@"Très proche du soleil on trouve Mercure qui accompagne toujours le Soleil dans sa course. La surface de Mercure est recouverte de cratères qui sont des impacts de météorites qui ont percuté la planète.";
    
    self.venustxt=@"Venus est la 2éme planètes du système solaire. La sonde Magellan révéla que la surface de venus est désert chaud comprenant des cratères, des volcans et des montagnes.";
    
    self.terretxt=@"La Terre est la seule planète ou la vie est possible.  La vie sur terre  est apparue il y a 3 Milliards d’années .L’atmosphère de la terre permet de capter la chaleur et la lumière du soleil nécessaire au développement de la vie mais stoppe les rayons ultraviolets qui sont dangereux pour les êtres vivants. L’atmosphère contient de l’oxygène sans lequel nous ne pouvons respirer.";
    
    self.marstxt=@"A l’extérieur de l’orbite terrestre la première rencontre est Mars, la planète rouge, planète de l’action Mars est la 4ème planète du système solaire. C’est la dernière  planète tellurgique, les planètes suivantes sont des planètes gazeuses (sauf pluton) Mars se caractérise par sa couleur rouge qui est due à la présence d’oxyde de fer dans la poussière de sa surface.";
    
    self.jupitertxt=@"Jupiter est la première planète lente, la plus grosse du système solaire, 12fois supérieur à la Terre. Entourée de quelques dizaines de satellites, elle produit sa propre énergie.";
    
    self.saturnetxt=@"Presque aussi volumineuse que Jupiter. Saturne est reconnaissable à son anneau formé pour l’essentiel de poussières et de blocs de glace. Malgré sa taille Saturne est si légère qu’elle pourrait flotter sur l’eau. Saturne est la 6eme planète du système solaire, c’est une planète géante gazeuse.";
    
    self.uranustxt=@"Uranus fut découvert par le musicien William Herschel en 1781. La planète se compose de 3 couches : un noyau fait de roches fondues, une couche faite de glace, d’ammoniaque et de méthane solide et une couche constituée d’hydrogène liquide. C’est la présence de méthane dans l’atmosphère qui donne à la planète sa couleur bleu-vert.";
    
    self.neptunetxt=@"Magnifique planète bleu. Neptune fut découverte en 1846. Elle a un noyau rocheux entouré par un océan de méthane, d’ammoniaque et d’eau. Sa couleur bleu est due à la présence de méthane dans l’atmosphère : le rouge est absorbé et le bleu diffusé.";
    
    self.plutontxt=@"(Depuis le 24 aout 2006, pluton n’est plus considéré comme une planète du système solaire). Pluton se trouve à quelque six milliard de kms du soleil. C’est la plus petite planète ; elle est plus petite que la lune.";
    
    
    
    self.myLabel.text = self.str;
    if([self.str isEqualToString:@"Soleil"]){
        [img setImage :[UIImage  imageNamed:@"soleil"]];
        desc.text=self.soleiltxt;
    }
    if([self.str isEqualToString:@"Mercure"]){
        [img setImage :[UIImage imageNamed:@"mercure"]];
          desc.text=self.mercuretxt;
        
    }
    if([self.str isEqualToString:@"Venus"]){
        [img setImage :[UIImage imageNamed:@"venus"]];
          desc.text=self.venustxt;
        
    }
    if([self.str isEqualToString:@"Terre"]){
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
    if([self.str isEqualToString:@"Saturne"]){
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
    if([self.str isEqualToString:@"Pluton"]){
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
