//
//  CellTableViewCell.m
//  SelfSizingCells
//
//  Created by Marius Constantinescu on 15/02/15.
//  Copyright (c) 2015 Marius. All rights reserved.
//

#import "Cell.h"
#import <UIImageView+AFNetworking.h>
@interface Cell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation Cell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configureCellWithData:(Data*)data
{
	self.titleLabel.text = data.title;
	self.detailLabel.text = data.text;
	[self.cellImageView setImageWithURL:data.imageURL];
}

@end
