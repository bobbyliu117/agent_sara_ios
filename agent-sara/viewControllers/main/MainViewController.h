//
//  ViewController.h
//  agent-sara
//
//  Created by Chang Liu on 2/23/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scvParent;
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;
@property (weak, nonatomic) IBOutlet UITextField *tfComments;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;


@end

