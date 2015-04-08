//
//  AWPType.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPType.h"

@implementation AWPType
-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _type = [self.internalData objectForKey:@"code"];
        _background = [[AWPBackground alloc] initWithBackgroundString:[self.internalData objectForKey:@"background"]];
        
        if ([[_type lowercaseString] isEqualToString:@"text"]) {
            _typeValue = type_text;
        }
        if ([[_type lowercaseString] isEqualToString:@"image"]) {
            _typeValue = type_image;
        }
        
        if ([[_type lowercaseString] isEqualToString:@"galeriamultimedia"]) {
            _typeValue = type_photo_galery;
        }

        if ([[_type lowercaseString] isEqualToString:@"contacto"]) {
            _typeValue = type_contact;
        }
        if ([[_type lowercaseString] isEqualToString:@"redessociales"]) {
            _typeValue = type_network;
        }
        if ([[_type lowercaseString] isEqualToString:@"video"]) {
            _typeValue = type_video;
        }
        
        //NUEVAS PAGINAS
        
        if ([[_type lowercaseString] isEqualToString:@"photo_txt_gridlist"]) {
            _typeValue = type_photo_txt_grid_list;
        }
        
        if ([[_type lowercaseString] isEqualToString:@"catalogo"]) {
            _typeValue = type_catalogo;
        }

        if ([[_type lowercaseString] isEqualToString:@"image_text"]) {
            _typeValue = type_photo_text;
        }
        if ([[_type lowercaseString] isEqualToString:@"image_text_title"]) {
            _typeValue = type_photo_text;
        }
        
        if ([[_type lowercaseString] isEqualToString:@"accordion_text_list"]) {
            _typeValue = type_accordion_text;
        }
        if ([[_type lowercaseString] isEqualToString:@"text_list"]) {
            _typeValue = type_text_list;
        }
        if ([[_type lowercaseString] isEqualToString:@"img_txt_list"]) {
            _typeValue = type_photo_txt_grid_list;
        }
        if ([[_type lowercaseString] isEqualToString:@"txt_img_list"]) {
            _typeValue = type_photo_txt_grid_list;
        }
        if ([[_type lowercaseString] isEqualToString:@"text_photo_text"]) {
            _typeValue = type_txt_photo_txt;
        }

        
        if ([[_type lowercaseString] isEqualToString:@"multiple_image_text_gridlist"]) {
            _typeValue = type_text_list;
        }
    }
    return self;
}


@end
