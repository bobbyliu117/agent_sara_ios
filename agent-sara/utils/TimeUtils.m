//
//  TimeUtils.m
//  agent-sara
//
//  Created by Chang Liu on 2/27/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import "TimeUtils.h"

@implementation TimeUtils

+(NSString*)getDateStringFromDate:(double)timestamp format:(NSString*)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    return [dateFormatter stringFromDate:date];
}

@end
