//
//  ViewController.m
//  KeyboardTest
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextView *visibleTextView;
@property (strong, nonatomic) IBOutlet UITextField *hiddenTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // I turned off autocorrection and autocapitalization since it was appearing even when the text field was hidden. An easy alternative is to just place the frame of the UITextField offscreen.
    self.hiddenTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.hiddenTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.hiddenTextField.delegate = self;
    
    [self.hiddenTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"The string typed is %@",string);
    self.visibleTextView.text = [self.visibleTextView.text stringByAppendingString:string];
    return YES;
}

@end
