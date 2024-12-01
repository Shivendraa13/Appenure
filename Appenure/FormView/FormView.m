//
//  FormView.m
//  Appenure
//
//  Created by Preyash on 30/11/24.
//

#import "FormView.h"

@implementation FormView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    // Load the view from the XIB
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FormView" owner:self options:nil];
    UIView *view = [nib firstObject];
    
    // Set the frame of the loaded view
    view.frame = self.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // Add the loaded view as a subview
    [self addSubview:view];
}



- (IBAction)submitButtonTapped:(id)sender {
    // Get the text from both text fields
    NSString *title = self.titleText.text;
    NSString *description = self.descriptionText.text;
    
    // Print the text of both text fields
    NSLog(@"Title: %@", title);
    NSLog(@"Description: %@", description);
}

- (IBAction)closeButton:(id)sender {
    [self removeFromSuperview];
}
@end
