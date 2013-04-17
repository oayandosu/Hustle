#import <UIKit/UIKit.h>
#import "Shot.h"


@interface ShotCell : UITableViewCell

@property (nonatomic, strong) Shot* shot;
@property (nonatomic, weak) IBOutlet UIImageView* previewImageView;
@property (nonatomic, weak) IBOutlet UIImageView* avatarImageView;
@property (nonatomic, weak) IBOutlet UILabel* nameLabel;
@property (nonatomic, weak) IBOutlet UILabel* viewsCountLabel;
@property (nonatomic, weak) IBOutlet UILabel* commentsCountLabel;
@property (nonatomic, weak) IBOutlet UILabel* likeCountLabel;

@end





