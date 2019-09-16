//
//  ZTArchiveTool.h
//  Tools
//
//  Created by 周天荣 on 2019/8/29.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZTArchiveTool : NSObject

+ (BOOL)archiveObject:(id)object prefix:(NSString *)prefix;
+ (id)unarchiveClass:(Class)class prefix:(NSString *)prefix;

@end

NS_ASSUME_NONNULL_END
