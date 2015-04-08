//
//  AWPMultipleImageTextGridListViewController.m
//  portfolio
//
//  Created by diana leon on 11/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPMultipleImageTextGridListViewController.h"



#import "AWPPhotoTxtGridListPage.h"

@interface AWPMultipleImageTextGridListViewController ()
@property (nonatomic, assign) AWPMenu* menu;
@property (nonatomic, assign) AWPTheme* theme;
@end

@implementation AWPMultipleImageTextGridListViewController

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
    self.menu = pfMan.portfolio.menu;
    self.theme = pfMan.portfolio.theme;
    
    NSString* home_img = pfMan.portfolio.theme.homeImage;
    
    //FONDO COLOR LISO, no imagen
    //[self.bgImage setImageWithURL:[NSURL URLWithString:home_img]];
    
    AWPPhotoTxtGridListPage* glPage = (AWPPhotoTxtGridListPage*)self.page;
    UIFont *customFont = [UIFont fontWithName:@"Lato-Black" size:16.0];
    self.titulo.font = customFont;

    
    self.titulo.text = glPage.title;
    
    //gradiente
    self.bgTitulo.startPoint = CGPointMake(0.0, 0.0);
    self.bgTitulo.endPoint = CGPointMake(1.0, 1.0);
    self.bgTitulo.startColor =[UIColor colorWithHexString: glPage.type.background.bgStartColor andAlpha:1 ];
    self.bgTitulo.endColor =[UIColor colorWithHexString: self.theme.titleBarBackground.bgStartColor   andAlpha:1];
    //[self applyShadowToView:self.bgTitulo];
    
    self.collectionView.backgroundColor = [UIColor colorWithHexString: self.theme.titleBarBackground.bgEndColor  andAlpha:1 ];
    
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
        UIImageView *grad = (UIImageView*)[cell viewWithTag:1];
        //grad.startPoint = CGPointMake(0.0, 0.0);
        //grad.endPoint = CGPointMake(1.0, 1.0);
        //grad.startColor = [UIColor colorWithHexString: @"fffffff" andAlpha:1.0 ];
        //grad.endColor = [UIColor colorWithHexString:  @"fffffff" andAlpha:1.0];
        //[grad.layer setCornerRadius:30.0f];
        
        if ((indexPath.item % 2==0)){
             [grad setImage:[UIImage imageNamed:@"fondoIzq.png"]];
        }else{
            [grad setImage:[UIImage imageNamed:@"fondoDer.png"]];
        }

        
        
        
        
        //titulo
        UILabel *titulo = (UILabel*)[cell viewWithTag:3];
        UIFont *customFont = [UIFont fontWithName:@"Lato-Regular" size:11.0];
        titulo.font = customFont;

        titulo.text = tObj.content;
        titulo.textColor = [UIColor colorWithHexString:tObj.textColor andAlpha:1];
        [titulo sizeToFit];
        //    [titulo setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:14]];
        //texto
        //UILabel *texto = (UILabel*)[cell viewWithTag:3];
        //texto.text = tObj.content;
        //texto.textColor = [UIColor colorWithHexString:tObj.textColor andAlpha:1];
        //[texto sizeToFit];
        AWPImageObject *iObj = (AWPImageObject *)obj;
        //imagen
        UIImageView *imagen = (UIImageView*)[cell viewWithTag:2];
        [imagen setImageWithURL:[NSURL URLWithString:iObj.content_img]];
        //        texto.frame = [self adjustedLabelFrame:texto];
        
        //        [self applyShadowToView:cell];
    } /*else if (obj.type == object_type_image) {
        cellIdentifier = @"ImageCollectionCell";
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        AWPImageObject *iObj = (AWPImageObject *)obj;
        //imagen
        UIImageView *imagen = (UIImageView*)[cell viewWithTag:1];
        [imagen setImageWithURL:[NSURL URLWithString:iObj.content_img]];
        
    }*/
    
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
