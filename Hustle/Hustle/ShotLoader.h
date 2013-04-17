#import <Foundation/Foundation.h>


typedef enum {
    kFeedType_Popular,
    kFeedType_Everyone,
    kFeedType_Debuts,
} FeedType;

typedef void(^Completion)(BOOL error);

@interface ShotLoader : NSObject

@property (nonatomic, strong) NSMutableArray* shots;
@property (nonatomic, readonly) BOOL hasMorePages;

- (id)initWithType:(FeedType)type;
- (void)reloadDataWithCompletion:(Completion)completion;
- (void)fetchNextPageWithCompletion:(Completion)completion;
    
@end






