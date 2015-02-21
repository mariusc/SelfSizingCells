//
//  CellTableViewCell.h
//  SelfSizingCells
//
//  Created by Marius Constantinescu on 15/02/15.
//  Copyright (c) 2015 Marius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface Cell : UITableViewCell

- (void)configureCellWithData:(Data*)data;
@end
