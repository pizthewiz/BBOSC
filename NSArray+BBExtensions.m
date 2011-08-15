//
//  NSArray+BBExtensions.m
//  BBOSC
//
//  Created by Jonathan del Strother on 09/09/2009.
//  Copyright 2009 Best Before Media Ltd. All rights reserved.
//

#import "NSArray+BBExtensions.h"


@implementation NSArray(BBExtensions)
- (NSArray *)map: (id (^)(id obj))block
{
	NSMutableArray *new = [NSMutableArray array];
	for(id obj in self)
	{
		id newObj = block(obj);
		[new addObject: newObj ? newObj : [NSNull null]];
	}
	return new;
}


- (NSArray *)select: (BOOL (^)(id obj))block
{
	NSMutableArray *new = [NSMutableArray array];
	for(id obj in self)
	{
		BOOL selected = block(obj);
		if (selected)
			[new addObject:obj];
	}
	return new;
}

-(NSDictionary*)qcStructure {
    NSMutableDictionary* result = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString* key = [[NSString alloc] initWithFormat:@"%d", (unsigned long)idx];
        [result setObject:obj forKey:key];
        [key release];
    }];
    return result;
}
@end
