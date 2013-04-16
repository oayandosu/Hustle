#import "FeedTableViewController.h"
#import "IIViewDeckController.h"


@implementation FeedTableViewController {
    NSArray* _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self reloadData];
}

#pragma mark - Data Loading
- (void)reloadData {
    [_shotLoader loadDataWithCompletion:^(BOOL error, NSArray *items) {
        // TODO: handle error case
        
        _items = items;
        [self.tableView reloadData];
    }];
}

#pragma mark - Actions
- (IBAction)toggleSidebar:(id)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

@end
