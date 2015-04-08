//
//  AWPHomePageViewController.m
//  portfolio
//
//  Created by diana leon on 3/31/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPHomePageViewController.h"
#import "AWPImagePage.h"
#import "UIColor+ColorWithHex.h"
#import "AWPPage.h"
#import "AWPImageObject.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

#import "AWPMenuViewController.h"

@interface AWPHomePageViewController ()
@property (nonatomic, assign) AWPMenu* menu;
@property (nonatomic, assign) AWPTheme* theme;
@end

@implementation AWPHomePageViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

   	//CONTENIDO
    AWPPortfolioManager* pfMan = [AWPPortfolioManager sharedManager];
    self.menu = pfMan.portfolio.menu;
    self.theme = pfMan.portfolio.theme;
    



    

    // relleno de la pagina con la imagen de la home (objeto del json)
//    AWPImageObject* iObj = [iPage.objects objectAtIndex:0];
//    [self.imagePage setImageWithURL:[NSURL URLWithString:iObj.content_img]];
    NSString* home_img = pfMan.portfolio.theme.homeImage;

    [self.imagePage setImageWithURL:[NSURL URLWithString:home_img]];
    
    self.imagePage.layer.zPosition = 0;
    NSString* tipoApp = [pfMan.portfolio.tipoAppSeleccionada lowercaseString];
    if ([tipoApp isEqualToString:@"8"])
    {
        self.tituloApplicacion.textColor = [UIColor colorWithHexString:self.menu.text_color andAlpha:1 ];
        UIFont *customFont = [UIFont fontWithName:@"OpenSans-Bold" size:26.0];
        self.tituloApplicacion.font =  customFont;
        self.tituloApplicacion.text = self.menu.title;
        [self.tituloApplicacion.text uppercaseString];
    
        self.bgTitle.startPoint = CGPointMake(0.0, 0.0);
        self.bgTitle.endPoint = CGPointMake(1.0, 1.0);

        self.bgTitle.startColor = [UIColor colorWithHexString: self.theme.titleBarBackground.bgStartColor  andAlpha:1 ];
        self.bgTitle.endColor = [UIColor colorWithHexString: self.theme.titleBarBackground.bgEndColor    andAlpha:1];

    }
    
    
    
    


    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
