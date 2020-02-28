//
//  TextUtils.h
//  agent-sara
//
//  Created by Chang Liu on 2/27/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextUtils : NSObject
+(BOOL)isValidEmail:(NSString*)email;
@end

NS_ASSUME_NONNULL_END
