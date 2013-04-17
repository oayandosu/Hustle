#import "FeedTableViewController.h"
#import "IIViewDeckController.h"
#import "Shot.h"
#import "ShotCell.h"
#import "SVProgressHUD.h"


@implementation FeedTableViewController {
    SSPullToRefreshView* _pullToRefreshView;
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
    [_shotLoader reloadDataWithCompletion:^(BOOL error) {
        // TODO: handle error case
        
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
    int count = _shotLoader.shots.count;
    if (_shotLoader.hasMorePages)
        count++;
    return count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= _shotLoader.shots.count)
        return 54.0f;
    return self.tableView.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= _shotLoader.shots.count)
        return [tableView dequeueReusableCellWithIdentifier:@"loading_cell" forIndexPath:indexPath];
    
    ShotCell* cell = [tableView dequeueReusableCellWithIdentifier:@"shot_cell" forIndexPath:indexPath];
    cell.shot = [_shotLoader.shots objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell.reuseIdentifier isEqualToString:@"loading_cell"]) {
        [_shotLoader fetchNextPageWithCompletion:^(BOOL error) {
            [self.tableView reloadData];
        }];
    }
}

@end
