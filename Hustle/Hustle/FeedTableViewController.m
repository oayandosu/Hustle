#import "FeedTableViewController.h"
#import "IIViewDeckController.h"


@implementation FeedTableViewController

#pragma mark - Actions
- (IBAction)toggleSidebar:(id)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

#pragma mark - Feed Loader
- (void)loadFeed:(FeedType)feed {
    switch (feed) {
        case kFeedType_Popular:
            self.title = @"Popular";
            break;
        case kFeedType_Everyone:
            self.title = @"Everyone";
            break;
        case kFeedType_Debuts:
            self.title = @"Debuts";
            break;
        case kFeedType_Playoffs:
            self.title = @"Playoffs";
            break;
        default:
            break;
    }
    [self reloadData];
}

- (void)reloadData {
}

@end
