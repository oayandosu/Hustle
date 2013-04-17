#import "ShotLoader.h"
#import "AFJSONRequestOperation.h"
#import "Shot.h"

#define kEndPointPopular        @"http://api.dribbble.com/shots/popular"
#define kEndPointEveryone       @"http://api.dribbble.com/shots/everyone"
#define kEndPointDebuts         @"http://api.dribbble.com/shots/debuts"

@implementation ShotLoader {
    NSString* _feedEndpoint;
    int _currentPage;
    int _totalPages;
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

- (void)reloadDataWithCompletion:(Completion)completion {
    _currentPage = 1;
    _hasMorePages = NO;
    _shots = [NSMutableArray array];
    [self loadDataWithCompletion:completion];
}

- (void)fetchNextPageWithCompletion:(Completion)completion {
    _currentPage++;
    [self loadDataWithCompletion:completion];
}

- (void)loadDataWithCompletion:(Completion)completion {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?page=%u", _feedEndpoint, _currentPage]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        // where are we in the # of pages?
        _totalPages = [[JSON objectForKey:@"pages"] intValue];
        _hasMorePages = _currentPage < _totalPages;
        
        for (NSDictionary* data in [JSON objectForKey:@"shots"]) {
            Shot* shot = [Shot objectWithDictionary:data];
            // don't add the same Shot object in twice
            // Why? in a feed thats constantly changing, rows might be pushed around to other pages
            if (![_shots containsObject:shot])
                [_shots addObject:shot];
        }
       
        completion(NO);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        completion(YES);
    }];
    [operation start];
}

@end
