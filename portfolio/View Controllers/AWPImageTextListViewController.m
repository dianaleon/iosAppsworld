//
//  AWPMultipleImageTextGridListViewController.m
//  portfolio
//
//  Created by diana leon on 11/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPImageTextListViewController.h"



#import "AWPPhotoTxtGridListPage.h"

@interface AWPImageTextListViewController ()
@property (nonatomic, assign) AWPMenu* menu;
@property (nonatomic, assign) AWPTheme* theme;
@end

@implementation AWPImageTextListViewController

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
    self.theme = pfMan.portfolio.theme;
    
    NSString* home_img = pfMan.portfolio.theme.homeImage;
    
    //FONDO COLOR LISO, no imagen
    //[self.bgImage setImageWithURL:[NSURL URLWithString:home_img]];
    
    AWPPhotoTxtGridListPage* glPage = (AWPPhotoTxtGridListPage*)self.page;
    
    
    UIFont *customFont = [UIFont fontWithName:@"Lato-Black" size:16.0];
    self.titulo.font = customFont;
    self.titulo.text = glPage.title;
    

    NSString* tipoApp = [pfMan.portfolio.tipoAppSeleccionada lowercaseString];
    
    if ([tipoApp isEqualToString:@"8"])
    {
        self.titulo.textAlignment = NSTextAlignmentCenter;
        UIFont *customFont = [UIFont fontWithName:@"OpenSans-Bold" size:16.0];
        self.titulo.font =  customFont;
    }
    
    
    
    //gradiente
    self.bgTitulo.startPoint = CGPointMake(0.0, 0.0);
    self.bgTitulo.endPoint = CGPointMake(1.0, 1.0);
    self.bgTitulo.startColor =[UIColor colorWithHexString: self.theme.titleBarBackground.bgStartColor  andAlpha:1 ];
    self.bgTitulo.endColor =[UIColor colorWithHexString: self.theme.titleBarBackground.bgEndColor   andAlpha:1];
    //[self applyShadowToView:self.bgTitulo];
    
    self.collectionView.backgroundColor = [UIColor colorWithHexString: glPage.type.background.bgStartColor andAlpha:1 ];
    
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
               /*
        if ((indexPath.item % 2==0)){
            [grad setImage:[UIImage imageNamed:@"fondoIzq.png"]];
        }else{
            [grad setImage:[UIImage imageNamed:@"fondoIzq2.png"]];
        }
        */
        
        
        
        
        //titulo
        UILabel *titulo = (UILabel*)[cell viewWithTag:5];
        UIFont *customFont = [UIFont fontWithName:@"Lato-Black" size:15.0];
        titulo.font = customFont;
        titulo.text = tObj.title;
        titulo.textColor = [UIColor colorWithHexString:@"000000" andAlpha:1];
        [titulo sizeToFit];
        
        //texto
        UILabel *texto = (UILabel*)[cell viewWithTag:3];
        texto.text = tObj.content;
        texto.textColor = [UIColor colorWithHexString:tObj.textColor andAlpha:1];
        UIFont *customFont1 = [UIFont fontWithName:@"Open Sans" size:12.0];
        texto.font = customFont1;
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
    
    CALayer *bottomBorder = [CALayer layer];
    
   // bottomBorder.frame = CGRectMake(0, 0, cell.frame.size.width, 1.0f);
   // bottomBorder.backgroundColor = [UIColor colorWithHexString:@"F6F6F6" andAlpha:1].CGColor;
    
    //[cell.layer addSublayer:bottomBorder];
    
    //cell.layer.borderWidth = 0.4;
    //cell.layer.borderColor = [UIColor colorWithHexString:@"#c2c2c2" andAlpha:1.0].CGColor;
    
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
