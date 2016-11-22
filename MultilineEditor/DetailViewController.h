//
//  DetailViewController.h
//  Editor
//
//  Created by Steven Fisher on 2016-11-21.
//  Copyright © 2016. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DetailItemChanged)();

@interface DetailViewController : UITableViewController

@property (copy, nonatomic) DetailItemChanged detailItemChanged;
@property (strong, nonatomic) NSDictionary *detailItem;

@end

