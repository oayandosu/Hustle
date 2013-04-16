#import <UIKit/UIKit.h>
#import "ShotLoader.h"
#import "SSPullToRefresh.h"


@interface FeedTableViewController : UITableViewController <SSPullToRefreshViewDelegate>

@property (nonatomic, retain) ShotLoader* shotLoader;

- (IBAction)toggleSidebar:(id)sender;

@end
