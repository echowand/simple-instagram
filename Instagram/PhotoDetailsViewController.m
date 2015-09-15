//
//  PhotoDetailsViewController.m
//  Instagram
//
//  Created by Aram Shahinfard on 9/14/15.
//  Copyright (c) 2015 Aram Shahinfard. All rights reserved.
//

#import "PhotoDetailsViewController.h"
#import "DetailCustomPhotoCellTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface PhotoDetailsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation PhotoDetailsViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"view did load   %@", self.photoURL);
    [self.myTableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCustomPhotoCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"com.yahoo.details"];
    
    NSString *imgURL = self.photoURL;
    [cell.myDeatilsCustomImageView setImageWithURL:[NSURL URLWithString:imgURL]];
    NSLog(@"tableView is: %@", self.photoURL);
    
    return cell;
}

@end
