#import "NavigationTableViewController.h"
#import "IIViewDeckController.h"
#import "FeedTableViewController.h"
#import "ShotLoader.h"


@implementation NavigationTableViewController {
    int _selectedNavIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // auto-navigato to the default row/item
    _selectedNavIndex = kStartingNavItem;
    [self performNavigationToIndex:_selectedNavIndex];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:_selectedNavIndex inSection:0]
                                animated:NO
                          scrollPosition:UITableViewScrollPositionTop];
}

#pragma mark - Navigation
- (void)performNavigationToIndex:(int)index {
    switch (_selectedNavIndex) {
        case 0:
            [self navigateToFeed:kFeedType_Popular];
            break;
        case 1:
            [self navigateToFeed:kFeedType_Everyone];
            break;
        case 2:
            [self navigateToFeed:kFeedType_Debuts];
            break;
//        case 3:
//            [self navigateToFeed:kFeedType_Playoffs];
//            break;
        default:
            break;
    }
}

- (void)navigateToFeed:(FeedType)feed {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];

    UINavigationController* navC = (UINavigationController*)[storyboard instantiateViewControllerWithIdentifier:@"feed"];
    FeedTableViewController* feedVC = (FeedTableViewController*)[navC.viewControllers objectAtIndex:0];
    feedVC.shotLoader = [[ShotLoader alloc] initWithType:feed];
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
//        case kFeedType_Playoffs:
//            titleImage = [UIImage imageNamed:@"title_playoffs"];
//            break;
        default:
            break;
    }
    feedVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:titleImage];
    
    self.viewDeckController.centerController = navC;
    [self.viewDeckController closeLeftView];
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_selectedNavIndex == indexPath.row)
        return;
    _selectedNavIndex = indexPath.row;
    [self performNavigationToIndex:_selectedNavIndex];
}

@end
