//
//  ViewUtils.h
//  agent-sara
//
//  Created by Chang Liu on 2/26/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewUtils : NSObject
+(void)alertWith:(UIViewController*)vc onSuccess:(OnSuccess)success;
+(void)toast:(UIViewController*)vc title:(NSString*)title message:(NSString*)msg;
@end

NS_ASSUME_NONNULL_END
