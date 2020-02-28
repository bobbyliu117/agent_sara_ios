//
//  DataManager.h
//  agent-sara
//
//  Created by Chang Liu on 2/24/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Customer;

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

+(void)saveCustomer:(Customer*)customer on:(OnSuccess)success or:(OnError)fail;
+(NSArray<Customer*>*)getCustomers;
@end

NS_ASSUME_NONNULL_END
