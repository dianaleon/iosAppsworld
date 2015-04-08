//
//  AWPDualImageTextGridListViewController.m
//  portfolio
//
//  Created by admin on 7/28/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPDualImageTextGridListViewController.h"
#import "AWPPhotoTxtGridListPage.h"

@interface AWPDualImageTextGridListViewController ()

@end

@implementation AWPDualImageTextGridListViewController

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
    
    AWPPhotoTxtGridListPage* glPage = (AWPPhotoTxtGridListPage*)self.page;
    
    self.titulo.text = glPage.title;
    
    //gradiente
    self.bgTitulo.startPoint = CGPointMake(0.0, 0.0);
    self.bgTitulo.endPoint = CGPointMake(1.0, 1.0);
    self.bgTitulo.startColor =[UIColor colorWithHexString: glPage.type.background.bgStartColor andAlpha:1 ];
    self.bgTitulo.endColor =[UIColor colorWithHexString: glPage.type.background.bgEndColor  andAlpha:1];
    [self applyShadowToView:self.bgTitulo];
    

}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    AWPPhotoTxtGridListPage* plPage = (AWPPhotoTxtGridListPage*)self.page;
    return plPage.objects.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AWPPhotoTxtGridListPage* plPage = (AWPPhotoTxtGridListPage*)self.page;
    AWPPageObject* obj = [plPage.objects objectAtIndex:indexPath.item];
    NSString* cellIdentifier = @"TextCollectionCell";//ImageCollectionCell
    UICollectionViewCell *cell = nil;
    if (obj.type == object_type_text) {
        AWPTextObject *tObj = (AWPTextObject *)obj;
        cellIdentifier = @"TextCollectionCell";
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        //gradiente
        MIHGradientView *grad = (MIHGradientView*)[cell viewWithTag:1];
        grad.startPoint = CGPointMake(0.0, 0.0);
        grad.endPoint = CGPointMake(1.0, 1.0);
        
        grad.startColor = [UIColor colorWithHexString: tObj.background.bgStartColor andAlpha:0.5 ];
        grad.endColor = [UIColor colorWithHexString: tObj.background.bgEndColor andAlpha:0.5];


        //titulo
        UILabel *titulo = (UILabel*)[cell viewWithTag:2];
        titulo.text = tObj.title;
        titulo.textColor = [UIColor colorWithHexString:tObj.textColor andAlpha:1];
        [titulo sizeToFit];
        //    [titulo setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:14]];
        //texto
        UILabel *texto = (UILabel*)[cell viewWithTag:3];
        texto.text = tObj.content;
        texto.textColor = [UIColor colorWithHexString:tObj.textColor andAlpha:1];
        [texto sizeToFit];
//        texto.frame = [self adjustedLabelFrame:texto];
        
//        [self applyShadowToView:cell];
    } else if (obj.type == object_type_image) {
        cellIdentifier = @"ImageCollectionCell";
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        AWPImageObject *iObj = (AWPImageObject *)obj;
        //imagen
        UIImageView *imagen = (UIImageView*)[cell viewWithTag:1];
        [imagen setImageWithURL:[NSURL URLWithString:iObj.content_img]];
        
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
