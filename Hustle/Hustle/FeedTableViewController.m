#import "FeedTableViewController.h"
#import "IIViewDeckController.h"
#import "Shot.h"
#import "SVProgressHUD.h"


@implementation FeedTableViewController {
    SSPullToRefreshView* _pullToRefreshView;
    NSArray* _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the background texture - sadly can't do this in the storyboard
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed: @"feed_background"]];
    
    // SSPullToRefresh needs us to tell it a view - customize here if you want something unique
    _pullToRefreshView = [[SSPullToRefreshView alloc] initWithScrollView:self.tableView
                                                                delegate:self];
    // lets use the simple content view
    _pullToRefreshView.contentView = [[SSPullToRefreshSimpleContentView alloc] init];
    
    [SVProgressHUD show];
    [self reloadData];
}

#pragma mark - Data Loading
- (void)reloadData {
    [_shotLoader loadDataWithCompletion:^(BOOL error, NSArray *items) {
        // TODO: handle error case
        
        _items = items;
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
        [_pullToRefreshView finishLoading];
    }];
}

#pragma mark - SSPullToRefresh Delegate
- (void)pullToRefreshViewDidStartLoading:(SSPullToRefreshView *)view {
    [self reloadData];
}

#pragma mark - Actions
- (IBAction)toggleSidebar:(id)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

#pragma mark - TableView Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Shot* shot = [_items objectAtIndex:indexPath.row];
//    cell.textLabel.text = shot.title;
    
    return cell;
}

@end
