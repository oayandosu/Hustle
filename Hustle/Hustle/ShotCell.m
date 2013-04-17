#import "ShotCell.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation ShotCell

- (void)prepareForReuse {
    _previewImageView.image = nil;
    _avatarImageView.image = nil;
}

- (void)setShot:(Shot*)shot {
    _shot = shot;
    
    _nameLabel.text = shot.player_name;
    _viewsCountLabel.text = [shot.viewsCount stringValue];
    _commentsCountLabel.text = [shot.commentsCount stringValue];
    _likeCountLabel.text = [shot.likesCount stringValue];
    
    _previewImageView.alpha = 0.0f;
    [_previewImageView setImageWithURL:[NSURL URLWithString:shot.imageUrl]
                      placeholderImage:nil
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                                 if (!error) { // fade in the image
                                     [UIView animateWithDuration:0.3f animations:^{
                                         _previewImageView.alpha = 1.0f;
                                     }];
                                 }
     }];
    
    [_avatarImageView setImageWithURL:[NSURL URLWithString:shot.player_avatar_url]];
}

@end
