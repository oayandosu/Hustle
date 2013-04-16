#import "Kiwi.h"
#import "ShotLoader.h"
#import "Shot.h"


SPEC_BEGIN(ShotLoaderSpec)

describe(@"ShotLoader", ^{
    context(@"loading a feed", ^{
        __block ShotLoader* shotLoader;
        __block NSArray* shots;
        beforeAll(^{
            shotLoader = [[ShotLoader alloc] initWithType:kFeedType_Popular];
            [shotLoader loadDataWithCompletion:^(BOOL error, NSArray *items) {
                shots = items;
            }];
        });
        
        it(@"should not be nil", ^{
            [shotLoader shouldNotBeNil];
        });
        
        it(@"should have Shots in the response", ^{
            [[expectFutureValue(shots) shouldEventually] beNonNil];
            [[expectFutureValue(theValue([shots count])) shouldEventually] beGreaterThan:theValue(0)];
            [[expectFutureValue([shots objectAtIndex:0]) shouldEventually] beKindOfClass:[Shot class]];
        });
        
        it(@"a Shot should have information needed for display", ^{
            [[expectFutureValue(((Shot*)[shots objectAtIndex:0]).title) shouldEventually] beNonNil];
            [[expectFutureValue(((Shot*)[shots objectAtIndex:0]).image_url) shouldEventually] beNonNil];
            [[expectFutureValue(((Shot*)[shots objectAtIndex:0]).views_count) shouldEventually] beNonNil];
            [[expectFutureValue(((Shot*)[shots objectAtIndex:0]).comments_count) shouldEventually] beNonNil];
            [[expectFutureValue(((Shot*)[shots objectAtIndex:0]).rebounds_count) shouldEventually] beNonNil];
//            [[expectFutureValue(((Shot*)[shots objectAtIndex:0]).player_name) shouldEventually] beNonNil];
//            [[expectFutureValue(((Shot*)[shots objectAtIndex:0]).player_avatar_url) shouldEventually] beNonNil];
        });
    });
});

SPEC_END


