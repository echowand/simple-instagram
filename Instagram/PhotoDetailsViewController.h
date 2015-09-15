//
//  PhotoDetailsViewController.h
//  Instagram
//
//  Created by Aram Shahinfard on 9/14/15.
//  Copyright (c) 2015 Aram Shahinfard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoDetailsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSString *photoURL;
@property (strong, nonatomic) NSString *photoCaption;

@end
