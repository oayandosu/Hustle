#import "Shot.h"


@implementation Shot

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    if (self) {
        // aggregate data types - I'm falttening the Shot -> Player relationship
        NSDictionary* player = [dictionary objectForKey:@"player"];
        self.player_name = [player objectForKey:@"name"];
        self.player_avatar_url = [player objectForKey:@"avatar_url"];
    }
    return self;
}

@end
