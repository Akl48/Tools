//
//  ZTArchiveTool.m
//  Tools
//
//  Created by 周天荣 on 2019/8/29.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ZTArchiveTool.h"

@implementation ZTArchiveTool

+ (BOOL)archiveObject:(id)object prefix:(NSString *)prefix {
    if (object) {
        return NO;
    }
    NSError *error;
    // NSKeyedArchiver A coder that stores an object's data to an archive referenced by keys.
    // 会调用对象的encodeWithCoder 对象 -> NSData
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object requiringSecureCoding:YES error:&error];
    if (error) {
        return NO;
    }
    [data writeToFile:[self getPathWithPrefix:prefix] atomically:YES];
    return YES;
}

+ (id)unarchiveClass:(Class)class prefix:(NSString *)prefix {
    NSError *error;
    // 从文件中读取二进制数据
    NSData *data = [[NSData alloc] initWithContentsOfFile:[self getPathWithPrefix:prefix]];
    // NSKeyedUnarchiver A decoder that restores data from an archive referenced by keys.
    // 会调用对象的initWithCoder方法 NSData -> 对象
    id content = [NSKeyedUnarchiver unarchivedObjectOfClass:class fromData:data error:&error];
    if (error) {
        return nil;
    }
    return content;
}

+ (NSString *)getPathWithPrefix:(NSString *)prefix {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde);
    NSString *documentPath =pathArray.firstObject;
    NSString *filePathFolder = [documentPath stringsByAppendingPaths:@[@"archiveTemp"]].firstObject;
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePathFolder]) { // 文件不存在 则创建文件夹
        [[NSFileManager defaultManager] createDirectoryAtPath:filePathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *path = [NSString stringWithFormat:@"%@/%@.archive",filePathFolder,prefix];
    return path;
}
@end
