#import "FeedTableViewController.h"
#import "IIViewDeckController.h"
#import "Shot.h"
#import "SVProgressHUD.h"


@implementation FeedTableViewController {
    NSArray* _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    }];
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
    cell.textLabel.text = shot.title;
    
    return cell;
}

@end
