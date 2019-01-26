//
//  Exceptions.m
//  MEOException
//
//  Created by Mitsuhau Emoto on 2019/01/26.
//  Copyright © 2019 Mitsuhau Emoto. All rights reserved.
//

#import "Exceptions.h"

@implementation ExcBlock

+ (void)executeBlock:(_Nonnull Block)block
          completion:(_Nonnull ExcCompletion)completion
{
    @try {
        block();
    } @catch (NSException *exception) {
        completion(exception);
    } @finally {
    }
}

@end
