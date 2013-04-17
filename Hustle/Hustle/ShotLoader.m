#import "ShotLoader.h"
#import "AFJSONRequestOperation.h"
#import "Shot.h"

#define kEndPointPopular        @"http://api.dribbble.com/shots/popular"
#define kEndPointEveryone       @"http://api.dribbble.com/shots/everyone"
#define kEndPointDebuts         @"http://api.dribbble.com/shots/debuts"

@implementation ShotLoader {
    NSString* _feedEndpoint;
}

- (id)initWithType:(FeedType)type {
    self = [super init];
    if (self) {
        switch (type) {
            case kFeedType_Popular:
                _feedEndpoint = kEndPointPopular;
                break;
            case kFeedType_Everyone:
                _feedEndpoint = kEndPointEveryone;
                break;
            case kFeedType_Debuts:
                _feedEndpoint = kEndPointDebuts;
                break;
        }
    }
    return self;
}

- (void)loadDataWithCompletion:(Completion)completion {
    NSURL *url = [NSURL URLWithString:_feedEndpoint];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSMutableArray* shots = [NSMutableArray array];
        for (NSDictionary* data in [JSON objectForKey:@"shots"]) {
            Shot* shot = [Shot objectWithDictionary:data];
            [shots addObject:shot];
        }
        
        completion(NO, [NSArray arrayWithArray:shots]);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        completion(YES, nil);
    }];
    [operation start];
}

@end
