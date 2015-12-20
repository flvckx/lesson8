//
//  ViewController.m
//  task3
//
//  Created by Anton Lookin on 12/16/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "FormViewController.h"
#import "ResultViewController.h"

@interface FormViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextView *commentsTextField;

@end

@implementation FormViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
	
}
- (IBAction)saveButtonPressed:(id)sender {
    if (![_nameTextField hasText] || ![_addressTextField hasText]) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"Name and Address text fields can't be empty."
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    } else if (![self validateEmailWithString:_emailTextField.text]) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"Email address isn't correct."
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    } else if ([_phoneTextField.text length] < 10) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"Please enter a valid mobile number!"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    } else {
        [self performSegueWithIdentifier:@"MySegue" sender:sender];
    }
}

- (BOOL)validateEmailWithString:(NSString*)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    
    if (textField.returnKeyType == UIReturnKeyNext) {
        if (textField == self.nameTextField) {
            [self.emailTextField becomeFirstResponder];
        } else if (textField == self.emailTextField) {
            [self.phoneTextField becomeFirstResponder];
        } else if (textField == self.phoneTextField) {
            [self.addressTextField becomeFirstResponder];
        } else if (textField == self.addressTextField) {
            [self.addressTextField resignFirstResponder];
     //     [self.commentsTextField becomeFirstResponder];
        }
    }
//    if(textField.returnKeyType==UIReturnKeyNext) {
//        UIView *next = [[textField superview] viewWithTag:textField.tag+1];
//        [next becomeFirstResponder];
//    } else if (textField.returnKeyType==UIReturnKeyDone) {
//        [textField resignFirstResponder];
//    }
    return NO;
}

- (void)keyboardDidShow:(NSNotification *) notification {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)keyboardDidHide:(NSNotification *) notification {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
