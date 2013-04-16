#import <Foundation/Foundation.h>


typedef enum {
    kFeedType_Popular,
    kFeedType_Everyone,
    kFeedType_Debuts,
    kFeedType_Playoffs
} FeedType;

typedef void(^Response)(BOOL error, NSArray* items);

@interface ShotLoader : NSObject

- (id)initWithType:(FeedType)type;

- (void)loadDataWithResponse:(Response)response;

@end
