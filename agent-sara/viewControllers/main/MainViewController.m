//
//  ViewController.m
//  agent-sara
//
//  Created by Chang Liu on 2/23/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import "MainViewController.h"
#import "DataManager.h"
#import "Customer.h"
#import "ViewUtils.h"
#import "TextUtils.h"

#define url1 @"https://us-central1-agent-sara-1.cloudfunctions.net/newCustomer"

@interface MainViewController ()
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Customer Registry";
    self.tfComments.delegate = self;
    self.tfPhone.delegate = self;
}

- (IBAction)onSubmitClicked {
    [self.view endEditing:YES];
    NSString *bodyStr = [self getBodyString];
    if (!bodyStr) {
        [ViewUtils toast:self title:@"" message:@"All required fields must be completed"];
        return;
    } else if (![self isValidEmail]) {
        [ViewUtils toast:self title:@"" message:@"Invalid Email"];
        return;
    } else if (![self isValidPhone]) {
        [ViewUtils toast:self title:@"" message:@"Invalid Phone"];
        return;
    }
    
    [self setEnableSubmit:NO];
    Customer *c = [Customer customer:[NSString stringWithFormat:@"%@%@", CUSTOMER_TAG, self.tfName.text] email:self.tfEmail.text phone:self.tfPhone.text comments:self.tfComments.text];
    [DataManager saveCustomer:c on:^(id _Nonnull data) {
        [c saveToContact:^(id data) {
            [ViewUtils alertWith:self onSuccess:^(id data) {
                [self.navigationController popViewControllerAnimated:YES];
            }];
        } failed:^(id error) {
            NSString *errorMsg = ((NSError*)error[@"error"]).localizedDescription;
            [ViewUtils toast:self title:@"" message:errorMsg];
        }];
    } or:^(NSString * _Nonnull error) {
        [ViewUtils toast:self title:@"Error" message:@"Something is not right..."];
    }];
}

#pragma mark - URLSessions

- (NSMutableURLRequest*)getBasicRequest:(NSString*)urlString
                             bodyString:(NSString*)bodyString
                                 method:(NSString*)method {
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    [request setHTTPMethod:method];
    if (bodyString) {
        NSData *body = [bodyString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        [request setHTTPBody:body];
    }
    return request;
}

-(void)postNewCustomer:(NSString*)bodyStr{
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:[self getBasicRequest:url1 bodyString:bodyStr method:@"POST"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        NSError *err;
        id json = nil;
        NSHTTPURLResponse *res = (NSHTTPURLResponse*)response;
        if (data != nil && data.length > 0) {
            json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            if (err) {
                NSLog(@"Parse data %@ with err: %@", data, err);
            } else {
                NSLog(@"Status: %ld, Data: %@",(long)res.statusCode, json);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self cleanup];
                });
            }
        }
    }];
    
    [task resume];
}

#pragma mark - Utils

-(NSString*)getBodyString {
    if ([self.tfName.text isEqualToString:@""] || [self.tfEmail.text isEqualToString:@""] || [self.tfPhone.text isEqualToString:@""]) {
        return nil;
    }
    return [NSString stringWithFormat:@"name=%@&email=%@&phone=%@", self.tfName.text, self.tfEmail.text, self.tfPhone.text];
}

-(void)cleanup {
    [self setEnableSubmit:YES];
    self.tfName.text=@""; self.tfEmail.text=@""; self.tfPhone.text=@""; self.tfComments.text=@"";
    [ViewUtils toast:self title:@"Sign-up Success" message:@"Thank you! You are all set!"];
}

-(void)setEnableSubmit:(BOOL)enable {
    [self.btnSubmit setEnabled:enable];
    [self.btnSubmit setBackgroundColor:enable?UIColor.systemPinkColor:UIColor.lightGrayColor];
    [self.btnSubmit setTitleColor:enable?UIColor.whiteColor:UIColor.grayColor forState:UIControlStateNormal];
}

-(BOOL)isValidEmail {
    return [TextUtils isValidEmail:self.tfEmail.text];
}

-(BOOL)isValidPhone {
    return self.tfPhone.text.length >= 10;
}

#pragma mark - UITextFieldDelegate
BOOL adjusted = NO;
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"Y: %f", textField.superview.frame.origin.y);
    if (textField.superview.frame.origin.y > 175 && !adjusted) {
        adjusted = YES;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:TRUE];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - 100, self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (textField.superview.frame.origin.y > 175 && adjusted) {
        adjusted = NO;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:TRUE];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + 100, self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
}

@end
