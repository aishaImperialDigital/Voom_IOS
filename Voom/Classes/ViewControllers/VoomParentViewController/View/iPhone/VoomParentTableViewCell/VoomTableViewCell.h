//
//  VoomTableViewCell.h
//  Voom
//
//  Created by user on 15/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VoomUITableViewCellDelegate <NSObject>
@optional
- (void)voomTableViewButtonClicked:(id) sender;
@end

@interface VoomTableViewCell : UITableViewCell{
    
}
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, strong) IBOutlet UIImageView *iconImage;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, assign) id <VoomUITableViewCellDelegate> delegate;

@end

