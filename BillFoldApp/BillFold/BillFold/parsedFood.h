//
//  FoodAndPrices.h
//  BillFold
//
//  Created by Kim Girard on 2014-07-07.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParsedFood : NSObject

@property NSString *food;
@property NSString *price;
@property (atomic) int counter ;

@end
