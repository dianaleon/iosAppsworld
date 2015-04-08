//
//  AWPViewController.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/6/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPMenuGridIconViewController.h"
#import "AWPImagePageViewController.h"
#import "UIColor+ColorWithHex.h"
#import "AWPPage.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface AWPMenuGridIconViewController ()

@property(nonatomic, assign) AWPMenu *menu;
@property(nonatomic, assign) AWPTheme *theme;
@property(nonatomic, strong) NSArray *menuColors;

@end

@implementation AWPMenuGridIconViewController

- (NSArray *)getDefaultMenuColors {
  NSMutableArray *array = [NSMutableArray new];
  AWPPortfolioManager *pfMan = [AWPPortfolioManager sharedManager];

  /*[array addObject:@{@"bgColor": [UIColor colorWithHexString:@"#DB0083"
   andAlpha:1.0], @"textColor": [UIColor colorWithHexString:@"#F3DEE0"
   andAlpha:1.0]}];
   [array addObject:@{@"bgColor": [UIColor colorWithHexString:@"#800040"
   andAlpha:1.0], @"textColor": [UIColor colorWithHexString:@"#F3DEE0"
   andAlpha:1.0]}];
   [array addObject:@{@"bgColor": [UIColor colorWithHexString:@"#EED4D8"
   andAlpha:1.0], @"textColor": [UIColor colorWithHexString:@"#7E005D"
   andAlpha:1.0]}];
   [array addObject:@{@"bgColor": [UIColor colorWithHexString:@"#EE6D95"
   andAlpha:1.0], @"textColor": [UIColor colorWithHexString:@"#7E005D"
   andAlpha:1.0]}];
   [array addObject:@{@"bgColor": [UIColor colorWithHexString:@"#8A0069"
   andAlpha:1.0], @"textColor": [UIColor colorWithHexString:@"#F3DEE0"
   andAlpha:1.0]}];
   */
  [array addObject:@{
    @"bgColor" : [UIColor
        colorWithHexString:pfMan.portfolio.theme.menuBackground.bgStartColor
                  andAlpha:1.0],
    @"textColor" : [UIColor colorWithHexString:@"#FFFFFF" andAlpha:1.0]
  }];
  [array addObject:@{
    @"bgColor" : [UIColor
        colorWithHexString:pfMan.portfolio.theme.menuBackground.bgStartColor
                  andAlpha:1.0],
    @"textColor" : [UIColor colorWithHexString:@"#FFFFFF" andAlpha:1.0]
  }];
  [array addObject:@{
    @"bgColor" : [UIColor
        colorWithHexString:pfMan.portfolio.theme.menuBackground.bgStartColor
                  andAlpha:1.0],
    @"textColor" : [UIColor colorWithHexString:@"#FFFFFF" andAlpha:1.0]
  }];
  [array addObject:@{
    @"bgColor" : [UIColor
        colorWithHexString:pfMan.portfolio.theme.menuBackground.bgStartColor
                  andAlpha:1.0],
    @"textColor" : [UIColor colorWithHexString:@"#FFFFFF" andAlpha:1.0]
  }];
  [array addObject:@{
    @"bgColor" : [UIColor
        colorWithHexString:pfMan.portfolio.theme.menuBackground.bgStartColor
                  andAlpha:1.0],
    @"textColor" : [UIColor colorWithHexString:@"#FFFFFF" andAlpha:1.0]
  }];

  return [NSArray arrayWithArray:array];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.menuColors = [self getDefaultMenuColors];
  self.collectionView.backgroundColor =
      [self.menuColors[2] objectForKey:@"bgColor"];
  // [self.collectionView registerClass:[UICollectionViewCell class]
  // forCellWithReuseIdentifier:@"MainMenuItemCell"];
  AWPPortfolioManager *pfMan = [AWPPortfolioManager sharedManager];
  self.menu = pfMan.portfolio.menu;
  self.theme = pfMan.portfolio.theme;
  NSString *home_img = pfMan.portfolio.theme.homeImage;
  NSString *title_img = pfMan.portfolio.menu.titleImage;

  [self.bgImage setImageWithURL:[NSURL URLWithString:home_img]];
    
    NSString* tipoApp = [pfMan.portfolio.tipoAppSeleccionada lowercaseString];
    if ([tipoApp isEqualToString:@"8"])
    {
        self.tituloAplicacion.text = self.menu.title;
        [self.tituloAplicacion.text uppercaseString];
    
        self.bgTitle.startPoint = CGPointMake(0.0, 0.0);
        self.bgTitle.endPoint = CGPointMake(1.0, 1.0);
    
        self.bgTitle.startColor = [UIColor colorWithHexString: self.theme.menuBackground.bgStartColor  andAlpha:1 ];
        self.bgTitle.endColor = [UIColor colorWithHexString: self.theme.menuBackground.bgEndColor    andAlpha:1];
        self.tituloAplicacion.textColor = [UIColor colorWithHexString:self.menu.text_color andAlpha:1 ];
        UIFont *customFont = [UIFont fontWithName:@"OpenSans-Bold" size:26.0];
        self.tituloAplicacion.font =  customFont;
        self.tituloAplicacion.text = self.menu.title;
        [self.tituloAplicacion.text uppercaseString];
    }

  // self.view.backgroundColor = [UIColor colorWithHexString:self.menu.
  // andAlpha:1.0];

  //    //HEADER
  //    self.bgHeader.startPoint = CGPointMake(0.0, 0.0);
  //    self.bgHeader.endPoint = CGPointMake(1.0, 1.0);
  //    //gradiente proviene del json
  //    //!!//theme->background
  //    self.bgHeader.startColor = [UIColor colorWithHexString:
  //    pfMan.portfolio.theme.background.bgStartColor andAlpha:1];
  //    self.bgHeader.endColor = [UIColor colorWithHexString:
  //    pfMan.portfolio.theme.background.bgEndColor  andAlpha:1];
  // TITULO Y SUBTITULO ??????
  // self.tituloApp.text = self.menu.title;
  // self.subtituloApp.text = self.menu.subtitle;
  //
  //    [self.tituloApp setFont:[UIFont
  //    fontWithName:@"CopperplateGothicStd-33BC" size:24]];
  //    self.tituloApp.textColor = [UIColor colorWithHexString: @"FFFFFF"
  //    andAlpha:1];
  //    [self.subtituloApp setFont:[UIFont
  //    fontWithName:@"CopperplateGothicStd-29AB" size:14]];
  //    self.subtituloApp.textColor = [UIColor colorWithHexString: @"000000"
  //    andAlpha:1];
}

- (void)viewWillLayoutSubviews {
  int altoCelda =
      ((UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout)
          .itemSize.height;
  CGFloat cantFilasMenu = ceilf(self.menu.pages.count * 1.0 / 3);
  CGFloat height = altoCelda * cantFilasMenu;
  CGFloat y = self.view.bounds.size.height - self.view.bounds.origin.y - height;
  self.collectionView.frame = CGRectMake(0, y, 320, height);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell =
      [collectionView dequeueReusableCellWithReuseIdentifier:@"MainMenuItemCell"
                                                forIndexPath:indexPath];
  NSInteger index = [self getItemIndex:indexPath];

  AWPPage *page = [self.menu.pages objectForKey:self.menu.pagesIndex[index]];
  //    NSString* hexColor = page.type.background;
  //
  //    cell.backgroundColor = [UIColor colorWithHexString:hexColor
  //    andAlpha:1.0];

    UILabel* label = (UILabel*)[cell viewWithTag:1];
    UIFont *customFont = [UIFont fontWithName:@"OpenSans-Semibold" size:14.0];
    label.text = page.title;
    label.font = customFont;

    
    
    
    UIImageView* image = (UIImageView*) [cell viewWithTag:2];
    [image setImageWithURL:[NSURL URLWithString:page.iconURL]];
//  cell.numero.text = [NSString stringWithFormat:@"%02d", index + 1];

  int colorIndex = index % self.menuColors.count;
  UIColor *bgColor = [self.menuColors[colorIndex] objectForKey:@"bgColor"];
  UIColor *textColor = [self.menuColors[colorIndex] objectForKey:@"textColor"];
  cell.backgroundColor = bgColor;
  

    UIFont *customFonte = [UIFont fontWithName:@"OpenSans-Semibold" size:10.0];
    label.font =  customFonte;
    label.textColor = textColor;
    
//  cell.numero.textColor = textColor;

  // FUENTES
  //
  //  [cell.label setFont:[UIFont fontWithName:@"Lato Black" size:20]];
  //
  //    //falta gradientes
  //    cell.label.textColor = [UIColor colorWithHexString:self.menu.text_color
  //    andAlpha:1.0];
  //    //seteado estatico de prueba
  //
  //
  //    cell.label.layer.backgroundColor = [UIColor colorWithHexString:
  //    @"#231B10"  andAlpha:1].CGColor;
  //
  //    //prueba bordes
  //    cell.label.layer.borderWidth =.8f;
  //    cell.label.layer.borderColor = [UIColor colorWithHexString:@"#998756"
  //    andAlpha:1.0].CGColor;

  //    switch ( indexPath.row % 3) {
  //        case 0:
  //            cell.backgroundColor = [UIColor redColor];
  //
  //            break;
  //        case 1:
  //            cell.backgroundColor = [UIColor blueColor];
  //            break;
  //
  //            case 2:
  //            cell.backgroundColor = [UIColor greenColor];
  //            break;
  //        default:
  //            break;
  //    }
  return cell;
}

- (int)getLayoutType {
  return self.menu.pages.count % 3;
}

- (NSInteger)getItemIndex:(NSIndexPath *)indexPath {
  int layoutType = [self getLayoutType];

  if ((layoutType == 0) || (indexPath.section == 0))
    return indexPath.item;
  else
    return indexPath.item + layoutType;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
    sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
  BOOL biggerItem = (indexPath.item % 3) == 1;

  if (biggerItem) {
    CGSize size =
        ((UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout)
            .itemSize;
    size.width += 2;
    return size;
  } else
    return ((UICollectionViewFlowLayout *)
                self.collectionView.collectionViewLayout).itemSize;
}

- (NSInteger)numberOfSectionsInCollectionView:
                 (UICollectionView *)collectionView {
  int layoutType = [self getLayoutType];

  if (layoutType == 0)
    return 1;
  else
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)view
     numberOfItemsInSection:(NSInteger)section {
  int layoutType = [self getLayoutType];

  if (section == 0) {
    if (layoutType == 0)
      return self.menu.pages.count;
    else
      return layoutType;
  } else
    return self.menu.pages.count - layoutType;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                                      layout:(UICollectionViewLayout *)
                                                 collectionViewLayout
    minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  int layoutType = [self getLayoutType];

  if (section == 0 && layoutType == 2) {
    CGSize size =
        ((UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout)
            .itemSize;
    return size.width;
  }

  return 0.0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {

  int layoutType = [self getLayoutType];
  if (layoutType == 1 && section == 0) {
    return UIEdgeInsetsMake(
        0,
        ((UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout)
            .itemSize.width,
        0,
        ((UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout)
            .itemSize.width);
  }
  return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)collectionView:(UICollectionView *)collectionView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSInteger index = [self getItemIndex:indexPath];

  AWPPage *page = [self.menu.pages objectForKey:self.menu.pagesIndex[index]];
  @try {
    AWPPageViewController *pageVC =
        [self.storyboard instantiateViewControllerWithIdentifier:page.layout];
    pageVC.page = page;

    [self.delegate changeToPage:pageVC];
  }
  @catch (NSException *exception) {
    NSLog(@"Layout doesn't exists: %@", exception.description);
  }
}

@end
