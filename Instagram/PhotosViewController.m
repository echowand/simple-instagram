//
//  PhotosViewController.m
//  Instagram
//
//  Created by Aram Shahinfard on 9/14/15.
//  Copyright (c) 2015 Aram Shahinfard. All rights reserved.
//

#import "PhotosViewController.h"
#import "CustomPhotoCell.h"
#import "UIImageView+AFNetworking.h"
#import "PhotoDetailsViewController.h"

@interface PhotosViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSArray *photos;
@end

@implementation PhotosViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"com.yahoo.something"];
    
    NSString *url = self.photos[indexPath.row][@"images"][@"low_resolution"][@"url"];
    
    [cell.myCustomImageView setImageWithURL:[NSURL URLWithString:url]];
    
    return cell;
}

//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?client_id=ffea331bec6a4ad1a4269dfd28b8166a"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        //NSLog(@"response: %@", responseDictionary);
        self.photos = responseDictionary[@"data"];
        [self.myTableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    PhotoDetailsViewController *photoDetailsViewController = [segue destinationViewController];
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:sender];
//    NSLog(@"here:   %@", self.photos[indexPath.row][@"images"][@"low_resolution"][@"url"]);
    photoDetailsViewController.photoURL = self.photos[indexPath.row][@"images"][@"low_resolution"][@"url"];
    photoDetailsViewController.photoCaption = self.photos[indexPath.row][@"caption"][@"text"];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
