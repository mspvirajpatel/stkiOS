//
//  STKEmptyRecentCell.m
//  StickerPipe
//
//  Created by Vadim Degterev on 03.08.15.
//  Copyright (c) 2015 908 Inc. All rights reserved.
//

#import "STKEmptyRecentCell.h"
#import "UIImage+CustomBundle.h"
#import "helper.h"

@interface STKEmptyRecentCell ()

@property (nonatomic, strong) UILabel* introLabel;

@end

@implementation STKEmptyRecentCell

- (instancetype)initWithFrame: (CGRect)frame {

	self = [super initWithFrame: frame];
	if (self) {
		UIImageView* introImageView = nil;
		if (FRAMEWORK) {
			introImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamedInCustomBundle: @"STKIntroImage"]];
		} else {
			introImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"STKIntroImage"]];
		}

		introImageView.translatesAutoresizingMaskIntoConstraints = NO;

		[self.contentView addSubview: introImageView];
		[self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: introImageView attribute: NSLayoutAttributeCenterX relatedBy: NSLayoutRelationEqual toItem: self.contentView attribute: NSLayoutAttributeCenterX multiplier: 1.0 constant: 0]];
		//TODO:Refactoring
		[self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: introImageView attribute: NSLayoutAttributeCenterY relatedBy: NSLayoutRelationEqual toItem: self.contentView attribute: NSLayoutAttributeCenterY multiplier: 1.0 constant: -15.0]];



//        UILabel *introLabel = [[UILabel alloc] init];
		self.introLabel = [[UILabel alloc] init];
		self.introLabel.font = [UIFont fontWithName: @"Helvetica-Neue-Regular" size: 14.0];
		self.introLabel.translatesAutoresizingMaskIntoConstraints = NO;
		//       introLabel.text = NSLocalizedString(@"Send emotions with Stickers", nil);
		self.introLabel.textColor = [UIColor colorWithRed: 151.0 / 255.0 green: 151.0 / 255.0 blue: 151.0 / 255.0 alpha: 1];
		[self.contentView addSubview: self.introLabel];

		[self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: self.introLabel attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: introImageView attribute: NSLayoutAttributeBottom multiplier: 1.0 constant: 0]];

		[self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: self.introLabel attribute: NSLayoutAttributeCenterX relatedBy: NSLayoutRelationEqual toItem: self.contentView attribute: NSLayoutAttributeCenterX multiplier: 1.0 constant: 0]];
	}
	return self;
}

- (void)configureWithText: (NSString*)text {
	self.introLabel.text = text;
}

@end
