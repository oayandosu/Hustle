#import <Foundation/Foundation.h>


@interface Shot : NSObject

@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* image_url;
@property (nonatomic, retain) NSNumber* views_count;
@property (nonatomic, retain) NSNumber* comments_count;
@property (nonatomic, retain) NSNumber* rebounds_count;
@property (nonatomic, retain) NSString* player_name;
@property (nonatomic, retain) NSString* player_avatar_url;

@end
