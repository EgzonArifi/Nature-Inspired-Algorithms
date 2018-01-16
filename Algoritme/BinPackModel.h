//
//  BinPackModel.h
//  Algoritme
//
//  Created by Egzon Arifi on 12/22/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinPackModel : NSObject

@property NSArray *weights;
@property NSInteger bin;
- (instancetype)initWithBin:(NSInteger)position weightValue:(NSArray *)weights;

@end

@interface ReturnBinModel : NSObject

@property float weight;
@property NSInteger position;
- (instancetype)initWithPosition:(NSInteger)position weightValue:(float)weight;

@end
