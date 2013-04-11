#import "MainViewController.h"


@implementation MainViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    // bootstrap the ViewDeck setup
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    self = [super initWithCenterViewController:nil
                            leftViewController:[storyboard instantiateViewControllerWithIdentifier:@"navigation"]];
    self.leftSize = 120.0f;
    self.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
    return self;
}

@end
