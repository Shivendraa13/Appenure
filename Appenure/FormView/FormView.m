//
//  FormView.m
//  Appenure
//
//  Created by Shivendra on 30/11/24.
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

- (IBAction)closeButton:(id)sender {
    [self removeFromSuperview];
}
@end
