#import "ShotLoader.h"
#import "AFJSONRequestOperation.h"
#import "Shot.h"


@implementation ShotLoader

- (id)initWithType:(FeedType)type {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)loadDataWithCompletion:(Completion)completion {
    NSURL *url = [NSURL URLWithString:@"http://api.dribbble.com/shots/popular"];
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
