//
//  Agent_SaraTests.m
//  Agent SaraTests
//
//  Created by Chang Liu on 2/27/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TextUtils.h"

@interface Agent_SaraTests : XCTestCase

@end

@implementation Agent_SaraTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    NSArray<NSString*> *testEmails = @[@"syjzi2012@gmail.com "];
    for (NSString *email in testEmails) {
        XCTAssertTrue([TextUtils isValidEmail:email]);
    }
}

-(void)testTime {
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
