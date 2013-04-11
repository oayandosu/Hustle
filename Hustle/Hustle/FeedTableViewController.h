#import <UIKit/UIKit.h>


typedef enum {
    kFeedType_Popular,
    kFeedType_Everyone,
    kFeedType_Debuts,
    kFeedType_Playoffs
} FeedType;

@interface FeedTableViewController : UITableViewController

- (void)loadFeed:(FeedType)feed;
- (IBAction)toggleSidebar:(id)sender;

@end
