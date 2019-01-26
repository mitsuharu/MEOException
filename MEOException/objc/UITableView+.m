//
//  UITableView+.m
//  MEOException
//
//  Created by Mitsuhau Emoto on 2019/01/26.
//  Copyright © 2019 Mitsuhau Emoto. All rights reserved.
//

#import "UITableView+.h"
#import <objc/runtime.h>

@interface TableViewExtension ()

@property (nonatomic, weak) UITableView *tableView;
- (instancetype)initWithTableView:(UITableView *)tableview;

@end

@implementation TableViewExtension

- (instancetype)initWithTableView:(UITableView *)tableview{
    self = [super init];
    if (self) {
        self.tableView = tableview;
    }
    return self;
}

- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
              withRowAnimation:(UITableViewRowAnimation)animation
                 excCompletion:(ExcCompletion)excCompletion{
    @try {
        [self.tableView reloadRowsAtIndexPaths:indexPaths
                              withRowAnimation:animation];
    } @catch (NSException *exception) {
        excCompletion(exception);
    } @finally {
    }
}

- (void)reloadSections:(NSIndexSet *)sections
      withRowAnimation:(UITableViewRowAnimation)animation
         excCompletion:(ExcCompletion)excCompletion
{
    @try {
        [self.tableView reloadSections:sections
                      withRowAnimation:animation];
    } @catch (NSException *exception) {
        excCompletion(exception);
    } @finally {
    }
}

- (void)insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
              withRowAnimation:(UITableViewRowAnimation)animation
                 excCompletion:(ExcCompletion)excCompletion
{
    @try {
        [self.tableView insertRowsAtIndexPaths:indexPaths
                              withRowAnimation:animation];
    } @catch (NSException *exception) {
        excCompletion(exception);
    } @finally {
    }
}

- (void)insertSections:(NSIndexSet *)sections
      withRowAnimation:(UITableViewRowAnimation)animation
         excCompletion:(ExcCompletion)excCompletion
{
    @try {
        [self.tableView insertSections:sections
                      withRowAnimation:animation];
    } @catch (NSException *exception) {
        excCompletion(exception);
    } @finally {
    }
}

- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
              withRowAnimation:(UITableViewRowAnimation)animation
                 excCompletion:(ExcCompletion)excCompletion
{
    @try {
        [self.tableView deleteRowsAtIndexPaths:indexPaths
                              withRowAnimation:animation];
    } @catch (NSException *exception) {
        excCompletion(exception);
    } @finally {
    }
}

- (void)deleteSections:(NSIndexSet *)sections
      withRowAnimation:(UITableViewRowAnimation)animation
         excCompletion:(ExcCompletion)excCompletion
{
    @try {
        [self.tableView deleteSections:sections
                      withRowAnimation:animation];
    } @catch (NSException *exception) {
        excCompletion(exception);
    } @finally {
    }
}

- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath
               toIndexPath:(NSIndexPath *)newIndexPath
             excCompletion:(ExcCompletion)excCompletion
{
    @try {
        [self.tableView moveRowAtIndexPath:indexPath
                               toIndexPath:newIndexPath];
    } @catch (NSException *exception) {
        excCompletion(exception);
    } @finally {
    }
}

@end


static void *TableViewExtensionKey = &TableViewExtensionKey;

@implementation UITableView (exception)

- (TableViewExtension*)exc{
    TableViewExtension *temp = objc_getAssociatedObject(self, TableViewExtensionKey);
    if (temp == nil){
        temp = [[TableViewExtension alloc] initWithTableView:self];
        [self setExc:temp];
    }
    return temp;
}

- (void)setExc:(TableViewExtension *)exc{
    objc_setAssociatedObject(self,
                             TableViewExtensionKey,
                             exc,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
