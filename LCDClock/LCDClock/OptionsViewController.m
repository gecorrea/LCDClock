//  OptionsViewController.m
//  LCDClock

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController


- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (IBAction)doneSelected:(id)sender {
        [self performSegueWithIdentifier:@"updateOptions" sender:self];
}

- (IBAction)lightGreenSelected:(id)sender {
    
}

- (IBAction)redSelected:(id)sender {
}

- (IBAction)blueSelected:(id)sender {
}

- (IBAction)darkGreenSelected:(id)sender {
}

@end
