//
//  AWPImageTextViewController.m
//  portfolio
//
//  Created by admin on 7/24/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPImageTextViewController.h"
#import "AWPTextPage.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "UIColor+ColorWithHex.h"

@interface AWPImageTextViewController ()

@end

@implementation AWPImageTextViewController

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
    // Do any additional setup after loading the view.
    AWPPortfolioManager* pfMan = [AWPPortfolioManager sharedManager];
    NSString* home_img = pfMan.portfolio.theme.homeImage;
    [self.bgImage setImageWithURL:[NSURL URLWithString:home_img]];

    
    
    
    AWPTextPage* plPage = (AWPTextPage*)self.page;
    
    self.titulo.text = plPage.title;

    //gradiente
    self.bgTitulo.startPoint = CGPointMake(0.0, 0.0);
    self.bgTitulo.endPoint = CGPointMake(1.0, 1.0);
    self.bgTitulo.startColor =[UIColor colorWithHexString: plPage.type.background.bgStartColor andAlpha:1 ];
    self.bgTitulo.endColor =[UIColor colorWithHexString: plPage.type.background.bgEndColor  andAlpha:1];
    [self applyShadowToView:self.bgTitulo];

    [self.imagen setImageWithURL:[NSURL URLWithString:plPage.iconURL]];
    self.texto.text = plPage.content;
    self.texto.frame = [self adjustedLabelFrame:self.texto];
    
    //CGRect bgTextoFrame = self.bgTexto.frame;
    //bgTextoFrame.size.height = self.texto.frame.origin.y+self.texto.frame.size.height+50;
    
    //self.bgTexto.frame = bgTextoFrame;
    [self applyShadowToView:self.bgTexto];
    
    
    CGSize scrollSize = self.scrollView.contentSize;
    scrollSize.height = self.bgTexto.frame.origin.y + self.bgTexto.frame.size.height;
    self.scrollView.contentSize = scrollSize;


}


-(CGRect) adjustedLabelFrame:(UILabel*)label
{
    //Calculate the expected size based on the font and linebreak mode of your label
    // FLT_MAX here simply means no constraint in height
    CGSize maximumLabelSize = CGSizeMake(label.frame.size.width, FLT_MAX);
    

    CGSize expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];

    //adjust the label the the new height.
    CGRect newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    
    return newFrame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
