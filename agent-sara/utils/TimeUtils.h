//
//  TimeUtils.h
//  agent-sara
//
//  Created by Chang Liu on 2/27/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FYearMonthDay @"yyyy-M-d hh:mm a"

NS_ASSUME_NONNULL_BEGIN

@interface TimeUtils : NSObject

+(NSString*)getDateStringFromDate:(double)timestamp format:(NSString*)format;

@end

NS_ASSUME_NONNULL_END
