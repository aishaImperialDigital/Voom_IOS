//
//  TollRoadsViewCell.h
//  Voom
//
//  Created by gqgnju on 30/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomTableViewCell.h"

@interface TollRoadsViewCell : VoomTableViewCell
{
    
}
@property (nonatomic, strong) IBOutlet UIView *holderView;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceLabel;
@end
