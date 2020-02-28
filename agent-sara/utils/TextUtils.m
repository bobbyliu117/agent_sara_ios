//
//  TextUtils.m
//  agent-sara
//
//  Created by Chang Liu on 2/27/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import "TextUtils.h"

@implementation TextUtils

+(BOOL)isValidEmail:(NSString*)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:[self trimWhitespace:email]];
}

+(NSString*)trimWhitespace:(NSString*)v {
    return [v stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
}

@end
