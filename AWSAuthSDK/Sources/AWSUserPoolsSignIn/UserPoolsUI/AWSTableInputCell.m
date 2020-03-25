//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSTableInputCell.h"

@implementation AWSTableInputCell

// Handle event when user finishes inputting text into a text field
- (IBAction)textEditingDidEnd:(id)sender {
	NSLog(@"textEditingDidEnd");
    if ([self.inputBox.text isEqual: @""]) {
		NSLog(@"textEditingDidEnd - hide headerLabel!");
        [self showHeaderLabel:NO];
    }
}

- (IBAction)textEditingDidBegin:(id)sender {
	NSLog(@"textEditingDidBegin");
    [self showHeaderLabel:YES];
}

- (void)onTap {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showHeaderLabel:YES];
        [self.inputBox becomeFirstResponder];
    });
}

- (void)showHeaderLabel:(BOOL)visible {
	NSLog(@"showHeaderLabel");
    if (visible && self.headerLabel.hidden) {
		NSLog(@"showHeaderLabel - 1");
        [UIView transitionWithView:self.placeHolderView
                          duration:0.3
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            self.placeHolderView.hidden = YES;
                            self.headerLabel.hidden = NO;
                            self.inputBox.hidden = NO;
                        }
                        completion:nil];
//    } else if (!visible && self.placeHolderView.isHidden) {
    } else  {
		NSLog(@"showHeaderLabel - 2");
        self.placeHolderView.alpha = 0;
        self.placeHolderView.hidden = NO;
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.placeHolderView.alpha = 1;
                             self.headerLabel.hidden = YES;
                             self.inputBox.hidden = YES;
                         }];
    }
}

- (void)setAWSTableInputCellFont {
	NSLog(@"setAWSTableInputCellFont");
    UIFont *font = [AWSAuthUIHelper getFont:[AWSAuthUIHelper getAWSUIConfiguration]];
    if (font != nil) {
        [self.placeHolderLabel setFont:font];
        [self.headerLabel setFont:font];
        [self.inputBox setFont:font];
    }
	
	/*
	if (self.inputBox.text && ([self.inputBox.text length] > 0)) {
		[self showHeaderLabel:YES];
	} else {
		[self showHeaderLabel:NO];
	}
	*/
	self.inputBox.adjustsFontSizeToFitWidth = NO;
}

@end
