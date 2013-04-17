#import "Shot.h"


@implementation Shot

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    if (self) {
        // id is special case since we can't call it an id
        self.shotId = [dictionary objectForKey:@"id"];
        
        // aggregate data types - I'm falttening the Shot -> Player relationship
        NSDictionary* player = [dictionary objectForKey:@"player"];
        self.player_name = [player objectForKey:@"name"];
        self.player_avatar_url = [player objectForKey:@"avatar_url"];
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[Shot class]])
        return NO;
    return self.shotId == ((Shot*)object).shotId;
}

@end
