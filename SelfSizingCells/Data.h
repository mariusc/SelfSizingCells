//
//  Data.h
//  SelfSizingCells
//
//  Created by Marius Constantinescu on 15/02/15.
//  Copyright (c) 2015 Marius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Data : NSObject
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSURL* imageURL;
@property (strong, nonatomic) NSString* text;

- (BOOL)updateFromDictionary:(NSDictionary *)dictionary;
@end
