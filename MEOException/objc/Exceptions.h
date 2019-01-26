//
//  Exceptions.h
//  MEOException
//
//  Created by Mitsuhau Emoto on 2019/01/26.
//  Copyright © 2019 Mitsuhau Emoto. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^Block)(void);
typedef void (^ExcCompletion)( NSException *exception );

@interface ExcBlock : NSObject

// （注意）期待した例外キャッチはできない
+ (void)executeBlock:(_Nonnull Block)block
          completion:(_Nonnull ExcCompletion)completion;

@end

NS_ASSUME_NONNULL_END
