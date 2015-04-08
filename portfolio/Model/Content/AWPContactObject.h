//
//  AWPContactObject.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/3/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPageObject.h"

@interface AWPContactObject : AWPPageObject

@property (nonatomic, readonly) NSString* subtype;
@property (nonatomic, readonly) AWPBaseModel* subObject;
@end
