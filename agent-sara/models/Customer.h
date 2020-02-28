//
//  Customer.h
//  agent-sara
//
//  Created by Chang Liu on 2/24/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CUSTOMER_TAG @"[KKK]"

NS_ASSUME_NONNULL_BEGIN

@interface Customer : NSObject
@property (nonatomic,strong) NSString *timestamp;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *comments;

+(instancetype)customer:(NSString*)name email:(NSString*)email phone:(NSString*)phone comments:(NSString*)comments;
+(instancetype)customerFrom:(NSDictionary*)dict;

-(NSDictionary*)toDict;
- (void)saveToContact:(OnSuccess)success failed:(OnError)failed;
- (NSString*)getTime;
@end

NS_ASSUME_NONNULL_END
