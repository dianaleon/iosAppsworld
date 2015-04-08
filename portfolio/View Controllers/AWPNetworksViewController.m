//
//  AWPNetworksViewController.m
//  portfolio
//
//  Created by diana leon on 4/1/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPNetworksViewController.h"
#import "AWPNetworkPage.h"
#import "UIColor+ColorWithHex.h"
#import "AWPPage.h"
#import "AWPNetworkObject.h"

#import "AWPMenuViewController.h"


@interface AWPNetworksViewController ()
@property (nonatomic, assign) AWPMenu* menu;
@property (nonatomic, assign) AWPTheme* theme;
@property (nonatomic, assign) AWPNetworkPage* page;
@property (nonatomic) NSInteger cellCount;
@property (nonatomic) UIEdgeInsets edgeInsets;

@end

@implementation AWPNetworksViewController

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
    //datos del menu
    AWPPortfolioManager* pfMan = [AWPPortfolioManager sharedManager];
    self.theme = pfMan.portfolio.theme;
    self.menu = pfMan.portfolio.menu;
    
    self.bgScroll.backgroundColor = [UIColor colorWithHexString:self.theme.titleBarBackground.bgStartColor    andAlpha:1];
    
    UIFont *customFont = [UIFont fontWithName:@"Lato-Black" size:16.0];
    self.titulo.font = customFont;
    
    self.titulo.text = self.page.title;
    NSString* tipoApp = [pfMan.portfolio.tipoAppSeleccionada lowercaseString];
    
    if ([tipoApp isEqualToString:@"8"])
    {
        self.titulo.textAlignment = NSTextAlignmentCenter;
    }
    
    [self.titulo.text uppercaseString];
    
    
    //gradiente
    self.bgTitulo.startPoint = CGPointMake(0.0, 0.0);
    self.bgTitulo.endPoint = CGPointMake(1.0, 1.0);
    self.bgTitulo.startColor =[UIColor colorWithHexString: self.theme.titleBarBackground.bgStartColor andAlpha:1 ];
    self.bgTitulo.endColor =[UIColor colorWithHexString: self.theme.titleBarBackground.bgEndColor  andAlpha:1];
    //[self applyShadowToView:self.bgTitulo];
    
    self.cellCount = (self.page.objects.count==5)?9:self.page.objects.count;
    self.edgeInsets = [self calculateEdgeInsets];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIEdgeInsets)calculateEdgeInsets {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *
                                          )self.collectionView.collectionViewLayout;
    CGSize iSize = layout.itemSize;
    CGFloat iSpacing = layout.minimumInteritemSpacing;
    CGFloat colWidth = self.collectionView.bounds.size.width;
    switch (self.page.objects.count) {
        case 1:
            return UIEdgeInsetsMake(150, (colWidth-iSize.width)/2, 30, (colWidth-iSize.width)/2);
        case 2:
            return UIEdgeInsetsMake(150, colWidth/2-iSize.width-iSpacing*2, 30, colWidth/2-iSize.width-iSpacing*2);
        case 3:
            return UIEdgeInsetsMake(70, (colWidth-iSize.width)/2, 30, (colWidth-iSize.width)/2);
        case 4:
            return UIEdgeInsetsMake(70, colWidth/2-iSize.width-iSpacing*2, 30, colWidth/2-iSize.width-iSpacing*2);
        case 5:
            return UIEdgeInsetsMake(70, 20, 30, 20);
        default:
            return UIEdgeInsetsMake(70, 15, 30, 15);
    }
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return self.cellCount;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString* cellIdentifier = @"NetworksCollectionCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return [self fillCell:cell withItem:indexPath.item];
}

-(NSInteger) getIndexForItem:(NSInteger)item
{
    if (self.page.objects.count == 5) {
        switch (item) {
            case 0:
                return 0;
            case 2:
                return 1;
            case 4:
                return 2;
            case 6:
                return 3;
            case 8:
                return 4;
            default:
                return -1;
        }
    } else
        return item;
}

-(UICollectionViewCell *) fillCell:(UICollectionViewCell *) cell withItem:(NSInteger)item
{
    NSInteger index = [self getIndexForItem:item];

    UIButton *button = (UIButton*)[cell viewWithTag:3];
    if (index < 0) {
        button.tag = -1;
        return cell;
    }
    
    AWPNetworkObject* netObj = [self.page.objects objectAtIndex:index];
    NSString* content = [netObj.subtype lowercaseString]; //tipo
    NSString* imageName = @"gBlanca.png";
    NSString* imageSelectedName = @"fb_hover.png";
    //    NSString* urlNetwork = [netObj.content lowercaseString];
    
    if ([content isEqualToString:@"facebook"])
    {
        imageName = @"fBlanca.png";
        imageSelectedName = @"fw.png";
    }
    else if ([content isEqualToString:@"twitter"])
    {
        imageName = @"tBlanca.png";
        imageSelectedName = @"tww.png";
    }
    else if ([content isEqualToString:@"linkedin"])
    {
        imageName = @"lBlanca.png";
        imageSelectedName = @"lw.png";
    }
    else if ([content isEqualToString:@"gplus"])
    {
        imageName = @"gBlanca.png";
        imageSelectedName = @"gw.png";
    }
    else if ([content isEqualToString:@"pinterest"])
    {
        imageName = @"pBlanca.png";
        imageSelectedName = @"pw.png";
    }
    else if ([content isEqualToString:@"instagram"])
    {
        imageName = @"iBlanca.png";
        imageSelectedName = @"inw.png";
    }
    else if ([content isEqualToString:@"flirck"])///
    {
        imageName = @"iBlanca.png";
        imageSelectedName = @"inw.png";
    }
    else if ([content isEqualToString:@"tuenti"])////
    {
        imageName = @"iBlanca.png";
        imageSelectedName = @"inw.png";
    }
    
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageSelectedName] forState:UIControlStateSelected];
    button.tag = index; // urlNetwork: como seteo la url a la cual tiene que redirigir
    return cell;
    
}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    
//}
- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return self.edgeInsets;
//    if (self.page.objects.count == 1) {
//        CGFloat newWidth = (self.collectionView.bounds.size.width);
//        return UIEdgeInsetsMake(0, (newWidth / 2), 0, (newWidth/2));
//    } else if ((self.page.objects.count == 2)||(self.page.objects.count == 4)) {
//        CGFloat newWidth = (self.collectionView.bounds.size.width-150);
//        return UIEdgeInsetsMake(0, (newWidth / 2), 0, (newWidth/2));
//    } else {
//        return UIEdgeInsetsMake(0, 20, 0, 20); // top, left, bottom, right
//    }
}


- (IBAction)networkButtonTouched:(UIButton*)sender {
    if (sender.tag < 0)
        return;
    
    AWPNetworkObject* netObj = [self.page.objects objectAtIndex:sender.tag];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: netObj.content]];
}


@end











