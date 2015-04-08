//
//  AWPPageViewController.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/14/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPageViewController.h"
#import "SKInnerShadowLayer.h"

@interface AWPPageViewController ()
@end

@implementation AWPPageViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)homeTouched:(id)sender {
    @try {
        AWPPageViewController* pageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"image"];
        
        [self.delegate changeToPage:pageVC];
    }
    @catch (NSException *exception) {
        NSLog(@"Layout doesn't exists: %@", exception.description);
    }
}

-(void)applyShadowToView:(UIView*)theView
{
    
    theView.layer.masksToBounds = NO;
    //    cell.layer.borderColor = [UIColor brownColor].CGColor;
    //    cell.layer.borderWidth = 1.0f;
    
    theView.clipsToBounds = YES;
    
    CALayer *border = [CALayer layer];
//    rightBorder.borderColor = [UIColor brownColor].CGColor;
//    border.borderColor = [UIColor colorWithRed:149.0/255.0 green:0.0/255.0 blue:86.0/255.0 alpha:1.0].CGColor;
    border.borderWidth = 0.5;
    
    
    CGFloat viewHeight = theView.bounds.size.height;
    border.frame = CGRectMake(0, -1, theView.bounds.size.width, viewHeight+1);
    
    [theView.layer addSublayer:border];
    
    SKInnerShadowLayer *innerShadowlayer = [[SKInnerShadowLayer alloc] init];
//	innerShadowlayer.colors = (@[ (id)[UIColor colorWithWhite:0.9 alpha:1.0].CGColor,
//                                  (id)[UIColor colorWithWhite:0.65 alpha:1.0].CGColor]);
    
	innerShadowlayer.frame = theView.bounds;
	innerShadowlayer.innerShadowRadius = 10;
    
	innerShadowlayer.innerShadowOpacity = 0.5f;
//	innerShadowlayer.innerShadowColor = [UIColor darkGrayColor].CGColor;
    
//	innerShadowlayer.borderColor = [UIColor colorWithRed:149.0/255.0 green:0.0/255.0 blue:86.0/255.0 alpha:1.0].CGColor;
//	innerShadowlayer.borderWidth = 0.75;
    
	[theView.layer addSublayer:innerShadowlayer];
//
//    theView.layer.contentsScale = [UIScreen mainScreen].scale;
//    
//    theView.layer.shadowOpacity = 0.5f;
//    theView.layer.shadowRadius = 15.0f;
//    theView.layer.shadowOffset = CGSizeZero;
//    theView.layer.shadowPath = [UIBezierPath bezierPathWithRect:theView.bounds].CGPath;
//    theView.layer.shouldRasterize = YES;
    
}

@end
