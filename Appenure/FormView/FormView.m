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
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FormView" owner:self options:nil];
    UIView *view = [nib firstObject];
    
    view.frame = self.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addSubview:view];
}



- (IBAction)submitButtonTapped:(id)sender {
    
    NSString *title = self.titleText.text;
    NSString *description = self.descriptionText.text;
    
    NSLog(@"Title: %@", title);
    NSLog(@"Description: %@", description);
}

- (IBAction)closeButton:(id)sender {
    [self removeFromSuperview];
}
@end
