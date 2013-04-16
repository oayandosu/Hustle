#import <UIKit/UIKit.h>
#import "ShotLoader.h"


@interface FeedTableViewController : UITableViewController

@property (nonatomic, retain) ShotLoader* shotLoader;

- (IBAction)toggleSidebar:(id)sender;

@end
