#import "JSONObject.h"


@interface Shot : JSONObject

@property (nonatomic, retain) NSString* shotId;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* imageUrl;
@property (nonatomic, retain) NSNumber* viewsCount;
@property (nonatomic, retain) NSNumber* commentsCount;
@property (nonatomic, retain) NSNumber* likesCount;
@property (nonatomic, retain) NSString* player_name;
@property (nonatomic, retain) NSString* player_avatar_url;

@end
