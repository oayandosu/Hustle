#import "FeedTableViewController.h"
#import "IIViewDeckController.h"


@implementation FeedTableViewController

#pragma mark - Actions
- (IBAction)toggleSidebar:(id)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

#pragma mark - Feed Loader
- (void)loadFeed:(FeedType)feed {
    UIImage* titleImage;
    switch (feed) {
        case kFeedType_Popular:
            titleImage = [UIImage imageNamed:@"title_popular"];
            break;
        case kFeedType_Everyone:
            titleImage = [UIImage imageNamed:@"title_everyone"];
            break;
        case kFeedType_Debuts:
            titleImage = [UIImage imageNamed:@"title_debuts"];
            break;
        case kFeedType_Playoffs:
            titleImage = [UIImage imageNamed:@"title_playoffs"];
            break;
        default:
            break;
    }
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:titleImage];
    [self reloadData];
}

- (void)reloadData {
}

@end
