//  OptionsViewController.m
//  LCDClock

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController


- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeLeft;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (IBAction)doneSelected:(id)sender {
    [self saveOptions]; // save user selected options prior to returning to clock.
    [self performSegueWithIdentifier:@"updateOptions" sender:self];
}

- (IBAction)lightGreenSelected:(id)sender {
    self.clockColor = @1;
}

- (IBAction)redSelected:(id)sender {
    self.clockColor = @2;
}

- (IBAction)blueSelected:(id)sender {
    self.clockColor = @3;
}

- (IBAction)darkGreenSelected:(id)sender {
    self.clockColor = @4;
}

- (void) saveOptions {
    NSUserDefaults *savedOptions = [NSUserDefaults standardUserDefaults];
    [savedOptions setObject:self.clockColor forKey:@"colorSelected"];
}

@end
