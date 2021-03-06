//
//  MCJSONValueTransformer.m
//  RealmJSONDemo
//
//  Created by Matthew Cheok on 27/7/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCJSONValueTransformer.h"

@interface MCJSONValueTransformer ()

@property (nonatomic, strong) NSDictionary *mappingDictionary;

@end

@implementation MCJSONValueTransformer

+ (instancetype)valueTransformerWithMappingDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithMappingDictionary:dictionary];
}

- (instancetype)initWithMappingDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _mappingDictionary = dictionary;
    }
    return self;
}

+ (BOOL)allowsReverseTransformation {
	return YES;
}

- (id)transformedValue:(id)value {
    if ([self.mappingDictionary objectForKey:value]) {
        return self.mappingDictionary[value];
    } else {
        return value;
    }
}

- (id)reverseTransformedValue:(id)value {
    NSArray *allKeys = [self.mappingDictionary allKeysForObject:value];
    if ([allKeys count]) {
        return [allKeys firstObject];
    } else {
        return value;
    }
}
@end
