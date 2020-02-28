//
//  ViewUtils.m
//  agent-sara
//
//  Created by Chang Liu on 2/26/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import "ViewUtils.h"

@implementation ViewUtils

+(void)alertWith:(UIViewController*)vc onSuccess:(OnSuccess)success {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"You are all set!" preferredStyle:UIAlertControllerStyleAlert];
    [alert setModalPresentationStyle:UIModalPresentationPopover];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        success(@{});
    }]];
    [vc presentViewController:alert animated:YES completion:nil];
}

+(void)toast:(UIViewController*)vc title:(NSString*)title message:(NSString*)msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert setModalPresentationStyle:UIModalPresentationPopover];
    
    [vc presentViewController:alert animated:YES completion:^{
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
          [alert dismissViewControllerAnimated:YES completion:nil];
        });
    }];
}

@end
