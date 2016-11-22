//
//  DetailViewController.m
//  Editor
//
//  Created by Steven Fisher on 2016-11-21.
//  Copyright © 2016. All rights reserved.
//

#import "DetailViewController.h"
#import "EditorCell.h"

@interface DetailViewController () <EditorCellDelegate>
@end

@implementation DetailViewController {
	NSMutableDictionary *_detailItem;
}

@synthesize detailItem = _detailItem;

static NSArray<NSDictionary *> *FieldNames;

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	self.detailItemChanged();
}

- (void)configureView {
	// Update the user interface for the detail item.
	if (self.detailItem) {
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];

	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		FieldNames = @[
					   @{@"key":@"first", @"label":@"First", @"type":@"line"},
					   @{@"key":@"middle", @"label":@"Middle", @"type":@"line"},
                       @{@"key":@"last", @"label":@"Last", @"type":@"line"},
                       @{@"key":@"company", @"label":@"Company", @"type":@"line"},
					   @{@"key":@"notes", @"label":@"Notes", @"type":@"multiline"},
		];
	});

	[self.tableView registerNib:[UINib nibWithNibName:@"MultilineTableViewCell" bundle:nil] forCellReuseIdentifier:@"multiline"];
	[self.tableView registerNib:[UINib nibWithNibName:@"LineTableViewCell" bundle:nil] forCellReuseIdentifier:@"line"];

	// Do any additional setup after loading the view, typically from a nib.
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	self.tableView.estimatedRowHeight = 60.0f;
//	self.notesField.textContainer.heightTracksTextView = YES;
	[self configureView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [FieldNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSDictionary *fieldInfo = FieldNames[indexPath.row];
	NSString *type = fieldInfo[@"type"];
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:type forIndexPath:indexPath];
	if ([cell conformsToProtocol:@protocol(EditorCell)]) {
		UITableViewCell<EditorCell> *editorCell = (UITableViewCell<EditorCell> *)cell;
		editorCell.delegate = self;
		editorCell.label = fieldInfo[@"label"] ?: @"";
		editorCell.value = _detailItem[fieldInfo[@"key"]] ?: @"";
	}
	return cell;
}


- (void)changedEditorCell:(UITableViewCell<EditorCell> *)cell {
	NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
	NSDictionary *fieldInfo = FieldNames[indexPath.row];
	_detailItem[fieldInfo[@"key"]] = cell.value;
}

- (NSDictionary *)detailItem {
	return [_detailItem copy];
}

- (void)setDetailItem:(NSDictionary *)newDetailItem {
	if (![_detailItem isEqual:newDetailItem]) {
	    _detailItem = [newDetailItem mutableCopy];
	    [self configureView];
	}
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return UITableViewAutomaticDimension;
}

@end
