//
//  MultilineTableViewCell.m
//  Editor
//
//  Created by Steven Fisher on 2016-11-21.
//  Copyright © 2016. All rights reserved.
//

#import "MultilineTableViewCell.h"

@interface MultilineTableViewCell()
@property (nonatomic, weak) IBOutlet UILabel *textLabel;
@property (nonatomic, weak) IBOutlet UITextView *textView;
@end

@implementation MultilineTableViewCell

@synthesize delegate = _delegate;
@synthesize textLabel = _textLabel;

- (void)awakeFromNib {
	[super awakeFromNib];
	_textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
}


- (void)textViewDidChange:(UITextView *)textView
{
	id view = [self superview];
	while (view && [view isKindOfClass:[UITableView class]] == NO) {
		view = [view superview];
	}
	UITableView *tableView = (UITableView *)view;

	CGPoint contentOffset = tableView.contentOffset;
	BOOL animationsEnabled = [UIView areAnimationsEnabled];
	[UIView setAnimationsEnabled:NO];
	[tableView beginUpdates];
	[tableView endUpdates];
	[UIView setAnimationsEnabled:animationsEnabled];
	tableView.contentOffset = contentOffset;

	[_delegate changedEditorCell:self];
}

- (NSString *)label {
	return self.textLabel.text;
}

- (void)setLabel:(NSString *)label {
	self.textLabel.text = label;
}

- (NSString *)value {
	return self.textView.text;
}

- (void)setValue:(id)value {
	self.textView.text = value;
}

@end
