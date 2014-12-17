//
//  ViewController.m
//  debugAlertController
//
//  Created by Tomusm on 17/12/2014.
//  Copyright (c) 2014 Thomas Malval. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnAlert;

- (IBAction)btnAlertTouched:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self tableView] setDelegate:self];
    [[self tableView] setDataSource:self];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [cell.textLabel setText:@"ALERT !"];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showAlert];
}


#pragma mark - Actions


- (IBAction)btnAlertTouched:(id)sender {
    [self showAlert];
}

#pragma mark - Show Alert

- (void)showAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Confirmation" message:@"Bonjour" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *no = [UIAlertAction actionWithTitle:@"Non" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"Oui" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:no];
    [alertController addAction:yes];
  // If you uncomment the two lines below it will work as expected with the didSelectRow
  //  dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:^{
            NSLog(@"Lol");
        }];
  //  });
}
@end
