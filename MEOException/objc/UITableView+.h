//
//  UITableView+.h
//  MEOException
//
//  Created by Mitsuhau Emoto on 2019/01/26.
//  Copyright © 2019 Mitsuhau Emoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exceptions.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewExtension : NSObject

- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
              withRowAnimation:(UITableViewRowAnimation)animation
                 excCompletion:(ExcCompletion)excCompletion;

- (void)reloadSections:(NSIndexSet *)sections
      withRowAnimation:(UITableViewRowAnimation)animation
         excCompletion:(ExcCompletion)excCompletion;

- (void)insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
              withRowAnimation:(UITableViewRowAnimation)animation
                 excCompletion:(ExcCompletion)excCompletion;

- (void)insertSections:(NSIndexSet *)sections
      withRowAnimation:(UITableViewRowAnimation)animation
         excCompletion:(ExcCompletion)excCompletion;

- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
              withRowAnimation:(UITableViewRowAnimation)animation
                 excCompletion:(ExcCompletion)excCompletion;

- (void)deleteSections:(NSIndexSet *)sections
      withRowAnimation:(UITableViewRowAnimation)animation
         excCompletion:(ExcCompletion)excCompletion;

- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath
               toIndexPath:(NSIndexPath *)newIndexPath
             excCompletion:(ExcCompletion)excCompletion;

@end

@interface UITableView (exception)

@property (nonatomic, retain) TableViewExtension* exc;

@end

NS_ASSUME_NONNULL_END
