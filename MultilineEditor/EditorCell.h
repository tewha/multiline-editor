//
//  EditorCell.h
//  Editor
//
//  Created by Steven Fisher on 2016-11-21.
//  Copyright © 2016. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditorCell;

@protocol EditorCellDelegate <NSObject>
- (void)changedEditorCell:(UITableViewCell<EditorCell> *)cell;
@end

@protocol EditorCell <NSObject>

@property (nonatomic, weak) id<EditorCellDelegate> delegate;
@property (nonatomic, copy) NSString *label;
@property (nonatomic, copy) NSString *value;

@end
