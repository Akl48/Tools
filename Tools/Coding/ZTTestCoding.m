//
//  ZTTestCoding.m
//  Tools
//
//  Created by 周天荣 on 2019/8/29.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ZTTestCoding.h"

@interface ZTTestCoding ()<NSSecureCoding>

@end

@implementation ZTTestCoding

+(BOOL)supportsSecureCoding {
    return YES;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_age forKey:@"age"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}

@end
