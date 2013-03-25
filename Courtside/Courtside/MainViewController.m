#import "MainViewController.h"


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"FirstTop"];
}

@end
