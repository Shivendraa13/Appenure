//
//  ViewController.h
//  Appenure
//
//  Created by Shivendra on 30/11/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *listCollectionView;

@property (weak, nonatomic) IBOutlet UIButton *createAction;

@end

