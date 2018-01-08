//
//  BinPackObjC.h
//  Algoritme
//
//  Created by Egzon Arifi on 12/22/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinPackModel.h"

typedef struct
{
    __unsafe_unretained NSArray *weights;
    NSInteger bin;
}Packs;

typedef struct
{
    NSInteger weight;
    NSInteger position;
}NewBin;


@interface BinPackObjC : NSObject


@property float binCapacity;
@property NSMutableArray <BinPackModel*>*bins;
@property NSMutableArray *weights;
- (instancetype)initWith:(NSArray *)weights andGenotype:(NSArray *)genotype;

@end
