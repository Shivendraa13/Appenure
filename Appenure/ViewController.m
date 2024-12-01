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
#import "Appenure-Bridging-Header.h"

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
        
        // Register a cell class or XIB
//        [self.listCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ChildCollectionViewCell"];
    
       // Programmatically add target to the button (optional if not using Interface Builder)
       [self.createAction addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
   }

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self setupCollectionViewLayout];
}

- (void)setupCollectionView {
    // Set the delegate and data source
    self.listCollectionView.delegate = self;
    self.listCollectionView.dataSource = self;
    
    // Register the custom cell
    UINib *cellNib = [UINib nibWithNibName:@"ChildCollectionViewCell" bundle:nil];
    [self.listCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"ChildCollectionViewCell"];
}

- (void)setupCollectionViewLayout {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.listCollectionView.collectionViewLayout;
    if (layout) {
        layout.minimumLineSpacing = 10;  // Space between rows
        layout.minimumInteritemSpacing = 0; // Space between items in a row (not needed if only 1 item per row)
        
        // Set item size to take full width of the collection view
        CGFloat width = CGRectGetWidth(self.listCollectionView.bounds) - 40; // Account for the leading and trailing padding (20 each side)
        layout.itemSize = CGSizeMake(width, 52); // Set the height of each cell to 52
    }
}


   // Action method for the button
   - (IBAction)buttonTapped:(id)sender {
       // Instantiate the form view and set up its properties
       self.formView = [[FormView alloc] initWithFrame:self.view.bounds];  // Set the frame to fill the screen
           self.formView.translatesAutoresizingMaskIntoConstraints = NO;

           // Add the form view to the current view
           [self.view addSubview:self.formView];

       [NSLayoutConstraint activateConstraints:@[
           [self.formView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
           [self.formView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
           [self.formView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
           [self.formView.heightAnchor constraintGreaterThanOrEqualToConstant:400] // Minimum height
       ]];

       
           // Add target for the submit button in FormView
           [self.formView.submitButtonAction addTarget:self action:@selector(formSubmit:) forControlEvents:UIControlEventTouchUpInside];

//      }
//   
//       [self.items addObject:[NSString stringWithFormat:@"Item %lu", (unsigned long)self.items.count + 1]];
//           
//           // Reload the collection view to reflect changes
//           [self.listCollectionView reloadData];
   }

- (void)formSubmit:(id)sender {
    // Get the title and description text from the form view
    NSString *title = self.formView.titleText.text;
        NSString *description = self.formView.descriptionText.text;
        
        // Check if the fields are not empty before adding to items
        if (title.length > 0 && description.length > 0) {
            // Add the title and description to the array
            [self.items addObject:@{ @"title": title, @"description": description }];
            
            // Reload the collection view to reflect the new item
            [self.listCollectionView reloadData];
        } else {
            NSLog(@"Form fields cannot be empty.");
            return;
        }
        
        // Dismiss the form view after submission
        [self.formView removeFromSuperview];
        self.formView = nil; 
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

// Cell for item at index path
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ChildCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ChildCollectionViewCell" forIndexPath:indexPath];
    
    // Configure the label
    NSDictionary *item = self.items[indexPath.item];
        
        // Set the title from the data
        cell.titleLabel.text = item[@"title"];
//    cell.titleLabel.text = [NSString stringWithFormat:@"Item %ld", (long)indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // Instantiate the ChildViewController
//    ChildViewController *childVC = [[ChildViewController alloc] init];
    ChildViewController *childVC = [[ChildViewController alloc] initWithNibName:@"ChildViewController" bundle:nil];
        
    NSDictionary *item = self.items[indexPath.item];
    childVC.descriptionLabel.text = item[@"description"];
    childVC.descriptionText = item[@"description"];
    [self.navigationController pushViewController:childVC animated:YES];
}

@end
