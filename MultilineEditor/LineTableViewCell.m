//
//  LineTableViewCell.m
//  Editor
//
//  Created by Steven Fisher on 2016-11-21.
//  Copyright © 2016. All rights reserved.
//

#import "LineTableViewCell.h"

@interface LineTableViewCell()
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UILabel *textLabel;
@end

@implementation LineTableViewCell

@synthesize delegate = _delegate;
@synthesize textLabel = _textLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (IBAction)editingChangedValueField:(UITextField *)sender {
	[_delegate changedEditorCell:self];
}

- (NSString *)label {
	return self.textLabel.text;
}

- (void)setLabel:(NSString *)label {
	self.textLabel.text = label;
}

- (NSString *)value {
	return self.textField.text;
}

- (void)setValue:(id)value {
	self.textField.text = value;
}

@end
