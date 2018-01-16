//
//  BinPackModel.m
//  Algoritme
//
//  Created by Egzon Arifi on 12/22/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

#import "BinPackModel.h"

@implementation BinPackModel

- (instancetype)initWithBin:(NSInteger)position weightValue:(NSArray *)weights
{
    self = [super init];
    if (self) {
        self.bin = position;
        self.weights = weights;
    }
    return self;
}
@end

@implementation ReturnBinModel

- (instancetype)initWithPosition:(NSInteger)position weightValue:(float)weight
{
    self = [super init];
    if (self) {
        self.position = position;
        self.weight = weight;
    }
    return self;
}
@end
