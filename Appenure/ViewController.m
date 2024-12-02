//
//  ViewController.m
//  Appenure
//
//  Created by Shivendra on 30/11/24.
//

#import "ViewController.h"
#import "Appenure-Swift.h"
#import "ChildCollectionViewCell.h"
#import "FormView.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) FormView *formView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = [NSMutableArray array];
   
        self.listCollectionView.delegate = self;
        self.listCollectionView.dataSource = self;
    
    [self setupCollectionView];
        
        self.listCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:@[
            [self.listCollectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
            [self.listCollectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
            [self.listCollectionView.heightAnchor constraintEqualToConstant:52]
        ]];
        
       [self.createAction addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
   }

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self setupCollectionViewLayout];
}

- (void)setupCollectionView {
    self.listCollectionView.delegate = self;
    self.listCollectionView.dataSource = self;
    
    UINib *cellNib = [UINib nibWithNibName:@"ChildCollectionViewCell" bundle:nil];
    [self.listCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"ChildCollectionViewCell"];
}

- (void)setupCollectionViewLayout {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.listCollectionView.collectionViewLayout;
    if (layout) {
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 0;
        
        CGFloat width = CGRectGetWidth(self.listCollectionView.bounds) - 40;
        layout.itemSize = CGSizeMake(width, 52);
    }
}


   - (IBAction)buttonTapped:(id)sender {
       
       self.formView = [[FormView alloc] initWithFrame:self.view.bounds];
           self.formView.translatesAutoresizingMaskIntoConstraints = NO;

           [self.view addSubview:self.formView];

       [NSLayoutConstraint activateConstraints:@[
           [self.formView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
           [self.formView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
           [self.formView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
           [self.formView.heightAnchor constraintGreaterThanOrEqualToConstant:400] // Minimum height
       ]];

           [self.formView.submitButtonAction addTarget:self action:@selector(formSubmit:) forControlEvents:UIControlEventTouchUpInside];

   }

- (void)formSubmit:(id)sender {
    
    NSString *title = self.formView.titleText.text;
        NSString *description = self.formView.descriptionText.text;
        
        if (title.length > 0 && description.length > 0) {
            
            [self.items addObject:@{ @"title": title, @"description": description }];
            
            [self.listCollectionView reloadData];
        } else {
            NSLog(@"Form fields cannot be empty.");
            return;
        }
    
        [self.formView removeFromSuperview];
        self.formView = nil; 
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ChildCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ChildCollectionViewCell" forIndexPath:indexPath];
    
    NSDictionary *item = self.items[indexPath.item];
        
        cell.titleLabel.text = item[@"title"];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    ChildViewController *childVC = [[ChildViewController alloc] initWithNibName:@"ChildViewController" bundle:nil];
        
    NSDictionary *item = self.items[indexPath.item];
    childVC.descriptionLabel.text = item[@"description"];
    childVC.descriptionText = item[@"description"];
    [self.navigationController pushViewController:childVC animated:YES];
}

@end
