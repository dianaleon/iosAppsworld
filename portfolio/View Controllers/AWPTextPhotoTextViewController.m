//
//  AWP.m
//  portfolio
//
//  Created by diana leon on 11/12/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPTextPhotoTextViewController.h"
#import "AWPTextPage.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "UIColor+ColorWithHex.h"

@interface AWPTextPhotoTextViewController ()
@property (assign, nonatomic) AWPTextPage* page;
@property (assign, nonatomic) AWPTheme* theme;
@end

@implementation AWPTextPhotoTextViewController

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
    AWPPortfolioManager* pfMan = [AWPPortfolioManager sharedManager];
    
    //BODY GRADIENTE
    self.bgBody.startPoint = CGPointMake(0.0, 0.0);
    self.bgBody.endPoint = CGPointMake(1.0, 1.0);
    self.bgBody.startColor =[UIColor colorWithHexString: self.page.type.background.bgStartColor andAlpha:1 ];
    self.bgBody.endColor =[UIColor colorWithHexString:self.page.type.background.bgEndColor   andAlpha:1];
    
    
    
    AWPTextPage* plPage = (AWPTextPage*)self.page;
    
    
    NSString* tipoApp = [pfMan.portfolio.tipoAppSeleccionada lowercaseString];
    
    if ([tipoApp isEqualToString:@"8"])
    {
       self.titulo.textAlignment = NSTextAlignmentCenter;
       UIFont *customFont = [UIFont fontWithName:@"OpenSans-Bold" size:16.0];
       self.titulo.font =  customFont;
        
    }
    
    self.titulo.text = plPage.title;
    //gradiente
    self.bgTitulo.startPoint = CGPointMake(0.0, 0.0);
    self.bgTitulo.endPoint = CGPointMake(1.0, 1.0);
    self.bgTitulo.startColor =[UIColor colorWithHexString: self.theme.titleBarBackground.bgStartColor  andAlpha:1 ];
    self.bgTitulo.endColor =[UIColor colorWithHexString: self.theme.titleBarBackground.bgEndColor  andAlpha:1];

    
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return self.page.objects.count;
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AWPPortfolioManager* pfMan = [AWPPortfolioManager sharedManager];
    
    AWPTextObject* tObj = [self.page.objects objectAtIndex:indexPath.item];
    
    NSString* cellIdentifier = @"PhotoTextListItem";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //gradiente
    MIHGradientView *grad = (MIHGradientView*)[cell viewWithTag:2];
    grad.startPoint = CGPointMake(0.0, 0.0);
    grad.endPoint = CGPointMake(1.0, 1.0);
    
    grad.startColor =[UIColor colorWithHexString: tObj.background.bgStartColor  andAlpha:1 ];
    grad.endColor = [UIColor colorWithHexString: tObj.background.bgEndColor   andAlpha:1];
    
    
    //imagen
    UIImageView *imagen = (UIImageView*)[cell viewWithTag:1];
    [imagen setImageWithURL:[NSURL URLWithString:tObj.content_img]];
    
    
    //texto
    UILabel *texto = (UILabel*)[cell viewWithTag:3  ];
    NSString* tipoApp = [pfMan.portfolio.tipoAppSeleccionada lowercaseString];
    
    
    if ([tipoApp isEqualToString:@"8"])
    {
        UIFont *customFontT = [UIFont fontWithName:@"OpenSans" size:12.0];
        texto.font = customFontT;

    }
    
    texto.text = tObj.content;
    texto.textColor = [UIColor colorWithHexString:tObj.textColor andAlpha:1.0];
    UILabel *titulo = (UILabel*)[cell viewWithTag:8  ];
    titulo.text = tObj.title;
    titulo.textColor = [UIColor colorWithHexString:tObj.titleColor andAlpha:1.0];
    
    if ([tipoApp isEqualToString:@"8"])
    {
        UIFont *customFontT = [UIFont fontWithName:@"OpenSans" size:14.0];
        titulo.font = customFontT;
        
    }

    
    return cell;
    
    
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
