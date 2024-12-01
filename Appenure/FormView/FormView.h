//
//  FormView.h
//  Appenure
//
//  Created by Shivendra on 30/11/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FormView : UIView

@property (weak, nonatomic) IBOutlet UITextField *titleText;
@property (weak, nonatomic) IBOutlet UITextField *descriptionText;
@property (weak, nonatomic) IBOutlet UIButton *submitButtonAction;

- (IBAction)closeButton:(id)sender;


@end

NS_ASSUME_NONNULL_END
