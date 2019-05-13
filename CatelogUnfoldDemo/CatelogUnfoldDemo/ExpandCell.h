//
//  ExpandCell.h
//  CatelogUnfoldDemo
//
//  Created by Mac on 2019/1/8.
//  Copyright © 2019年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExpandCell : UITableViewCell
@property (strong, nonatomic) NSMutableArray *expandArray;
@property (assign, nonatomic) NSIndexPath *indexPath;
+(instancetype)cellWithTable:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
