//
//  DataManager.m
//  agent-sara
//
//  Created by Chang Liu on 2/24/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import "DataManager.h"
#import "Customer.h"

@interface DataManager ()

@end

@implementation DataManager

static DataManager *_instance;

+ (void)load {
    _instance = DataManager.new;
}

+(NSString*)getCustomersPath {
    NSString *sandBox = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [sandBox stringByAppendingPathComponent:@"customers.plist"];
}

+(void)saveCustomer:(Customer*)customer on:(OnSuccess)success or:(OnError)fail {
    NSString *path = [self getCustomersPath];
    NSMutableArray *array = [[NSArray arrayWithContentsOfFile:path] mutableCopy];
    if (array) {
        [array addObject:[customer toDict]];
        [array writeToFile:path atomically:YES];
    } else {
        [@[[customer toDict]]writeToFile:path atomically:YES];
    }
    success(@{});
}

+(NSArray<Customer*>*)getCustomers {
    NSArray *array = [NSArray arrayWithContentsOfFile:[self getCustomersPath]];
    NSMutableArray *customers = NSMutableArray.array;
    for (NSDictionary *dict in array) {
        [customers addObject:[Customer customerFrom:dict]];
    }
    return customers;
}

@end
