//
//  Data.m
//  SelfSizingCells
//
//  Created by Marius Constantinescu on 15/02/15.
//  Copyright (c) 2015 Marius. All rights reserved.
//

#import "Data.h"
#import <KZPropertyMapper.h>

@implementation Data


- (BOOL)updateFromDictionary:(NSDictionary *)dictionary
{
	BOOL result = [KZPropertyMapper mapValuesFrom:dictionary
									   toInstance:self
									 usingMapping:@{
													@"title" : KZProperty(title),
													@"imageURL" : KZBox(URL, imageURL),
													@"text" : KZProperty(text)
													}];
	
	return result;
}

@end
