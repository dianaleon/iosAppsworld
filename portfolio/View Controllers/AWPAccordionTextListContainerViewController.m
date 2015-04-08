//
//  AWPAccordionTextListViewController.m
//  portfolio
//
//  Created by admin on 7/24/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPAccordionTextListContainerViewController.h"
//#import "KMAccordionTableViewController.h"
#import "AWPTextPage.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "UIColor+ColorWithHex.h"
#import "AWPAccordionViewController.h"


@interface AWPAccordionTextListContainerViewController () <KMAccordionTableViewControllerDataSource>

@property(nonatomic, strong) NSArray *sections;

@end

@implementation AWPAccordionTextListContainerViewController

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

    KMAccordionTableViewController* accordionVC = [AWPAccordionViewController new];

    accordionVC.dataSource = self;
    self.sections = [self getSectionsArray];
    accordionVC.sections = self.sections;
    [accordionVC setHeaderHeight:50];
    accordionVC.tableView.backgroundColor = [UIColor clearColor];
//        [accordionVC setHeaderArrowImageClosed:[UIImage imageNamed:@"carat-open"]];
//        [accordionVC setHeaderArrowImageOpened:[UIImage imageNamed:@"carat"]];
//        [accordionVC setHeaderFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
//        [accordionVC setHeaderTitleColor:[UIColor greenColor]];
        [accordionVC setHeaderSeparatorColor:[UIColor clearColor]];
//        [accordionVC setHeaderColor:[UIColor colorWithRed:0.114 green:0.114 blue:0.114 alpha:1]];
//        
    [self addChildViewController:accordionVC];
    accordionVC.view.frame = _containerView.bounds;
    [_containerView addSubview:accordionVC.view];
    
    [accordionVC didMoveToParentViewController:self];
    
}

-(NSArray*)getSectionsArray
{

    AWPTextPage* plPage = (AWPTextPage*)self.page;
    NSMutableArray* mutableSections = [NSMutableArray new];
    
    for (AWPTextObject* tObj in plPage.objects) {
        
        MIHGradientView *viewOfSection = [[MIHGradientView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        viewOfSection.startPoint = CGPointMake(0.0, 0.0);
        viewOfSection.endPoint = CGPointMake(1.0, 1.0);
        
        viewOfSection.startColor =[UIColor colorWithHexString: tObj.background.bgStartColor  andAlpha:1 ];
        viewOfSection.endColor = [UIColor colorWithHexString: tObj.background.bgEndColor   andAlpha:1];
        viewOfSection.backgroundColor = [UIColor colorWithHexString:@"020202" andAlpha:0.5];

        
        UILabel* texto = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 16)];
        [texto setFont:[UIFont fontWithName:@"Arial" size:14]];
        texto.text = tObj.content;
        texto.numberOfLines=0;
        texto.textAlignment = NSTextAlignmentLeft;
        texto.frame = [self adjustedLabelFrame:texto];
        texto.textColor = [UIColor colorWithRed:254.0/255 green:230.0/255 blue:210.0/255 alpha:1.0];

        [viewOfSection addSubview:texto];
        
        CGRect sectionFrame = viewOfSection.frame;
        sectionFrame.size.height = texto.frame.origin.y+texto.frame.size.height+50;
        
        viewOfSection.frame = sectionFrame;
        
        
        KMSection *section = [[KMSection alloc] init];
        section.view = viewOfSection;
        
//        [self applyShadowToView:viewOfSection];

        //    section1.title = @"My First Section";
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 57)];
        headerView.backgroundColor = [UIColor colorWithRed:203.0/255 green:0.0/255 blue:94.0/255 alpha:0.1];

        
//        headerView.startPoint = CGPointMake(0.0, 0.0);
//        headerView.endPoint = CGPointMake(1.0, 1.0);
//        
//        headerView.startColor =[UIColor colorWithHexString: tObj.background.bgStartColor  andAlpha:1 ];
//        headerView.endColor = [UIColor colorWithHexString: tObj.background.bgEndColor   andAlpha:1];
        
        UILabel* titulo = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 17)];
        titulo.text = tObj.title;
        [titulo setFont:[UIFont fontWithName:@"Arial Bold" size:15]];
        titulo.textAlignment = NSTextAlignmentLeft;
        titulo.numberOfLines = 1;
        titulo.textColor = [UIColor colorWithRed:254.0/255 green:230.0/255 blue:210.0/255 alpha:1.0];
        
        [headerView addSubview:titulo];
        
        section.overHeaderView = headerView;

//        [self applyShadowToView:headerView];

        [mutableSections addObject:section];
    }

    return [NSArray arrayWithArray:mutableSections];

}

- (NSInteger)numberOfSectionsInAccordionTableViewController:(KMAccordionTableViewController *)accordionTableView {
    return [self.sections count];
}

- (KMSection *)accordionTableView:(KMAccordionTableViewController *)accordionTableView sectionForRowAtIndex:(NSInteger)index {
    return self.sections[index];
}


- (CGFloat)accordionTableView:(KMAccordionTableViewController *)accordionTableView heightForSectionAtIndex:(NSInteger)index {
//    AWPTextPage* plPage = (AWPTextPage*)self.page;
//    AWPTextObject* tObj = [plPage.objects objectAtIndex:index];
//    
//    CGFloat textHeight = ceilf([self labelSizeForText:tObj.content withFont:[UIFont systemFontOfSize:16.0f] width:280 andLineBreakMode:UILineBreakModeTailTruncation].height);
//    return textHeight+45+50;
    KMSection *section = self.sections[index];
    return section.view.frame.size.height;
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
    
    
    CGSize expectedLabelSize = [text sizeWithFont:font constrainedToSize:maximumLabelSize lineBreakMode:lineBreakMode];
    //adjust the label the the new height.
    expectedLabelSize.height = ceilf(expectedLabelSize.height);
    
    return expectedLabelSize;
    
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
