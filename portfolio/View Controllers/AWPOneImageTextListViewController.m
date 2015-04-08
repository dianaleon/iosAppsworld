//
//  AWPOneImageTextListViewController.m
//  portfolio
//
//  Created by diana leon on 11/14/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPOneImageTextListViewController.h"
#import "AWPTextPage.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "UIColor+ColorWithHex.h"

@interface AWPOneImageTextListViewController ()

@end

@implementation AWPOneImageTextListViewController

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
    //NSString* home_img = pfMan.portfolio.theme.homeImage;
    //[self.bgImage setImageWithURL:[NSURL URLWithString:home_img]];

    AWPTextPage* plPage = (AWPTextPage*)self.page;
    self.titulo.text = plPage.title;
    NSString* tipoApp = [pfMan.portfolio.tipoAppSeleccionada lowercaseString];
    
    if ([tipoApp isEqualToString:@"8"])
    {
        self.titulo.textAlignment = NSTextAlignmentCenter;
    }
   [self.titulo.text uppercaseString];
    
    
    //gradiente
    self.bgTitulo.startPoint = CGPointMake(0.0, 0.0);
    self.bgTitulo.endPoint = CGPointMake(1.0, 1.0);
    self.bgTitulo.startColor =[UIColor colorWithHexString: pfMan.portfolio.theme.titleBarBackground.bgStartColor andAlpha:1 ];
    self.bgTitulo.endColor =[UIColor colorWithHexString: pfMan.portfolio.theme.titleBarBackground.bgEndColor  andAlpha:1];
    [self applyShadowToView:self.bgTitulo];
    //[self.imagen setImageWithURL:[NSURL URLWithString:plPage.content]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    AWPTextPage* plPage = (AWPTextPage*)self.page;
    return plPage.objects.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AWPTextPage* plPage = (AWPTextPage*)self.page;
    AWPTextObject* tObj = [plPage.objects objectAtIndex:indexPath.item];
    
    [self.imagen setImageWithURL:[NSURL URLWithString:tObj.content_img]];

    NSString* cellIdentifier = @"TxtListCollectionCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //    //gradiente
    MIHGradientView *grad = (MIHGradientView*)[cell viewWithTag:4];
    grad.startPoint = CGPointMake(0.0, 0.0);
    grad.endPoint = CGPointMake(1.0, 1.0);
    //
    grad.startColor =[UIColor colorWithHexString: tObj.background.bgStartColor andAlpha:1 ];
    grad.endColor = [UIColor colorWithHexString: tObj.background.bgEndColor  andAlpha:1];
    //
    //
    //    //imagen
    //    UIImageView *imagen = (UIImageView*)[cell viewWithTag:1];
    //    [imagen setImageWithURL:[NSURL URLWithString:tObj.content_img]];
    //titulo
    //UILabel *titulo = (UILabel*)[cell viewWithTag:1];
    //titulo.text = tObj.title;
    //titulo.textColor = [UIColor colorWithHexString: tObj.textColor andAlpha:1 ];
    //    [titulo setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:14]];
    //texto
    UILabel *texto = (UILabel*)[cell viewWithTag:2];
    texto.text = tObj.content;
    
    
    texto.frame = [self adjustedLabelFrame:texto];
    
    //[self applyShadowToView:cell];
    
    
    //    cell.layer.masksToBounds = NO;
    ////    cell.layer.borderColor = [UIColor brownColor].CGColor;
    ////    cell.layer.borderWidth = 1.0f;
    //
    //    cell.clipsToBounds = YES;
    //
    //    CALayer *rightBorder = [CALayer layer];
    //    rightBorder.borderColor = [UIColor brownColor].CGColor;
    //    rightBorder.borderWidth = 0.75;
    //
    //
    //    CGFloat cellHeight = cell.bounds.size.height;
    //    rightBorder.frame = CGRectMake(0, -1, cell.bounds.size.width, cellHeight+1);
    //
    //    [cell.layer addSublayer:rightBorder];
    //    cell.layer.contentsScale = [UIScreen mainScreen].scale;
    //
    //    cell.layer.shadowOpacity = 0.15f;
    //    cell.layer.shadowRadius = 5.0f;
    //    cell.layer.shadowOffset = CGSizeZero;
    //    cell.layer.shadowPath = [UIBezierPath bezierPathWithRect:cell.bounds].CGPath;
    //    cell.layer.shouldRasterize = YES;
    return cell;
    
    
}

-(CGRect) adjustedLabelFrame:(UILabel*)label
{
    //    CGSize expectedLabelSize = [label.text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    
    CGSize expectedLabelSize = [self labelSizeForText:label.text withFont:label.font width:label.frame.size.width andLineBreakMode:label.lineBreakMode];
    //adjust the label the the new height.
    CGRect newFrame = label.frame;
    newFrame.size.height = expectedLabelSize.height;
    
    return newFrame;
}

-(CGSize) labelSizeForText:(NSString*)text withFont:(UIFont*)font width:(CGFloat)width andLineBreakMode:(NSLineBreakMode)lineBreakMode
{
    //Calculate the expected size based on the font and linebreak mode of your label
    // FLT_MAX here simply means no constraint in height
    CGSize maximumLabelSize = CGSizeMake(width, FLT_MAX);
    
    
    return [text sizeWithFont:font constrainedToSize:maximumLabelSize lineBreakMode:lineBreakMode];
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    AWPTextPage* plPage = (AWPTextPage*)self.page;
    AWPTextObject* tObj = [plPage.objects objectAtIndex:indexPath.item];
    
    CGFloat cellHeight = ceilf([self labelSizeForText:tObj.content withFont:[UIFont systemFontOfSize:16.0f] width:280 andLineBreakMode:UILineBreakModeTailTruncation].height);
    CGSize cellSize = CGSizeMake(320,cellHeight+58+41);
    return cellSize;
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
