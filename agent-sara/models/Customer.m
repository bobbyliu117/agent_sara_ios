//
//  Customer.m
//  agent-sara
//
//  Created by Chang Liu on 2/24/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import "Customer.h"
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import "TimeUtils.h"

#define NAME @"name"
#define EMAIL @"email"
#define PHONE @"phone"
#define COMMENTS @"comments"
#define TIMESTAMP @"timestamp"

@implementation Customer

+(instancetype)customer:(NSString*)name email:(NSString*)email phone:(NSString*)phone comments:(NSString*)comments {
    Customer *newCustomer = [[self alloc]init];
    newCustomer.name = name;
    newCustomer.email = email;
    newCustomer.phone = phone;
    newCustomer.comments = comments;
    newCustomer.timestamp = [NSString stringWithFormat:@"%f", [NSDate.date timeIntervalSince1970]];
    return newCustomer;
}

+ (instancetype)customerFrom:(NSDictionary *)dict {
    Customer *newCustomer = [[self alloc]init];
    newCustomer.name = dict[NAME];
    newCustomer.email = dict[EMAIL];
    newCustomer.phone = dict[PHONE];
    newCustomer.comments = dict[COMMENTS];
    newCustomer.timestamp = dict[TIMESTAMP];
    return newCustomer;
}

- (NSDictionary *)toDict {
    return @{
        NAME             : self.name,
        EMAIL            : self.email,
        PHONE            : self.phone,
        COMMENTS         : self.comments,
        TIMESTAMP        : self.timestamp
    };
}

- (void)saveToContact:(OnSuccess)success failed:(OnError)failed {
    CNMutableContact *contact = [[CNMutableContact alloc]init];
    contact.givenName = self.name;
    contact.emailAddresses = @[[CNLabeledValue labeledValueWithLabel:CNLabelWork value:self.email]];
    contact.phoneNumbers = @[[CNLabeledValue labeledValueWithLabel:CNLabelWork value:[CNPhoneNumber phoneNumberWithStringValue:self.phone]]];
    
    CNSaveRequest *req = CNSaveRequest.new;
    [req addContact:contact toContainerWithIdentifier:nil];
    
    CNContactStore *store = CNContactStore.new;
    NSError *err;
    [store executeSaveRequest:req error:&err];
    if (err) {
        failed(@{@"error":err});
    } else {
        success(@{});
    }
}

- (NSString*)getTime {
    double db = self.timestamp.doubleValue;
    debugLog(@"%@ - %f", self.timestamp, db);
    return [TimeUtils getDateStringFromDate:db format:FYearMonthDay];
}

@end
