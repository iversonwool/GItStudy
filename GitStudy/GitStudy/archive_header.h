//
//  archive_header.h
//  GitStudy
//
//  Created by 李浩 on 16/8/5.
//  Copyright © 2016年 李浩. All rights reserved.
//

#ifndef archive_header_h
#define archive_header_h

#define ARCHIVE(ClassName) \
- (void)encodeWithCoder:(NSCoder *)aCoder {\
    unsigned int count = 0;\
    Ivar *ivars = class_copyIvarList([ClassName class], &count);\
    for (int i=0; i<count; i++) {\
        Ivar ivar = ivars[i];\
        const char *ivar_name = ivar_getName(ivar);\
        NSString *key = [NSString stringWithUTF8String:ivar_name];\
        [aCoder encodeObject:[self valueForKey:key] forKey:key];\
    }\
    free(ivars);\
}

#define UNARCHIVE(ClassName) \
- (instancetype)initWithCoder:(NSCoder *)aDecoder {\
    if (self = [super init]) {\
        unsigned int count = 0;\
        Ivar *ivars = class_copyIvarList([ClassName class], &count);\
        for (int i=0; i<count; i++) {\
            Ivar ivar = ivars[i];\
            const char *ivar_name = ivar_getName(ivar);\
            NSString *key = [NSString stringWithUTF8String:ivar_name];\
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];\
        }\
        free(ivars);\
    }\
    return self;\
}


#endif /* archive_header_h */
