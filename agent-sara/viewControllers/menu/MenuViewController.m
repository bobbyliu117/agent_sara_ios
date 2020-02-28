//
//  MenuViewController.m
//  agent-sara
//
//  Created by Chang Liu on 2/24/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import "MenuViewController.h"
#import "CustomersViewController.h"
#import "MainViewController.h"
#import "SSKeychain.h"
#import "ViewUtils.h"

#define BundleID NSBundle.mainBundle.bundleIdentifier

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblLastUser;
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"AGENT SARA";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tfPassword.text = @"";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (IBAction)onAgentClicked:(id)sender {
    if ([self credentialMatch]) {
        [self.navigationController pushViewController:[[CustomersViewController alloc]init] animated:NO];
    } else {
        [ViewUtils toast:self title:@"Login Failed" message:@"User doesn't exist"];
    }
}

-(BOOL)credentialMatch {
    NSString *username = self.tfUsername.text;
    NSString *password = self.tfPassword.text;
    if (![username isEqualToString:@""] && [password isEqualToString:@"123456"]) {
        return YES;
    }
    return NO;
}

- (IBAction)onNewCustomerClicked:(id)sender {
    [self.navigationController pushViewController:MainViewController.new animated:YES];
}

@end
