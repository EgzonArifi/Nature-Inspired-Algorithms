//
//  BinPackObjC.m
//  Algoritme
//
//  Created by Egzon Arifi on 12/22/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

#import "BinPackObjC.h"

@implementation BinPackObjC


- (instancetype)initWith:(NSArray *)weights andGenotype:(NSArray *)genotype
{
    self = [super init];
    if (self) {
        
        self.weights = [[NSMutableArray alloc] initWithArray:weights];
        self.bins = [[NSMutableArray alloc] init];
        
        ReturnBinModel *newBin;
        
        for (int i = 0; i<=genotype.count; i++) {
            
            NSNumber *mapXNum = genotype[i];
            NSInteger gen = [mapXNum integerValue];
            
            if (gen == 1) {
                newBin = [self FFA];
            } else if (gen == 2) {
                newBin = [self FFD];
            } else if (gen == 3) {
                newBin = [self FFA];
            }
            
            if (self.bins.count > 0) {
                
                BinPackModel *bin = self.bins[i];
                
                BOOL hasAnyPackFreeSpace = NO;
                
                for (int j; j<=self.bins.count; i++) {
                    
                    float sumedArr = 0;
                    for (NSNumber *num in bin.weights) {
                        sumedArr += [num floatValue];
                    }
                    
                    if ((sumedArr < 5.0000) && ((5.0000 - sumedArr) >= newBin.weight) && hasAnyPackFreeSpace == NO){
                        
                        hasAnyPackFreeSpace = YES;
                        NSMutableArray *lastWeights = [[NSMutableArray alloc] initWithArray:bin.weights];
                        [lastWeights addObject:[NSNumber numberWithFloat:newBin.weight]];
                        [self.bins removeObjectAtIndex:j];

                        BinPackModel *newBinPacki = [[BinPackModel alloc] initWithBin:bin.bin weightValue:lastWeights];
                        [self.bins insertObject:newBinPacki atIndex:j];
                        
                    }
                }
                
                if (!hasAnyPackFreeSpace) {
                    [self.bins addObject:[[BinPackModel alloc] initWithBin:self.bins.lastObject.bin+1
                                                               weightValue:@[
                                                                             [NSNumber numberWithFloat:newBin.weight]
                                                                             ]]];
                }
                
            } else {
                [self.bins addObject:[[BinPackModel alloc] initWithBin:1 weightValue:@[
                                                                                       [NSNumber numberWithFloat:newBin.weight]
                                                                                       ]]];
            }
            
            [self.weights removeObjectAtIndex:newBin.position];
        }
    }
    return self;
}

- (ReturnBinModel *)FFA {
    NSNumber *min = [self.weights valueForKeyPath:@"@min.floatValue"];
    NSInteger index = [self.weights indexOfObject:min];
    return [[ReturnBinModel alloc] initWithPosition:index weightValue:min.floatValue];
}

- (ReturnBinModel *)FFD {
    NSNumber *max = [self.weights valueForKeyPath:@"@max.floatValue"];
    NSInteger index = [self.weights indexOfObject:max];
    return [[ReturnBinModel alloc] initWithPosition:index weightValue:max.floatValue];
}

- (ReturnBinModel *)BB1 {
    
    return [[ReturnBinModel alloc] initWithPosition:0 weightValue:1.1];
}

@end

