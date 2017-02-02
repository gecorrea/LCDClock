//  OptionsViewController.m
//  LCDClock

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController


- (void) viewDidLoad {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *color = [defaults objectForKey:@"colorSelected"];
    if ([color isEqual:@"1"])
        [self.lightGreen setSelected:true];
    else if([color isEqual:@"2"])
        [self.red setSelected:true];
    else if ([color isEqual:@"3"])
        [self.blue setSelected:true];
    else if ([color isEqual:@"4"])
        [self.darkGreen setSelected:true];
    [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(updateView) userInfo:nil repeats:true];
}

- (void) updateView {
    NSArray *colorbuttons = [[NSArray alloc] initWithObjects:self.lightGreen, self.red, self.blue, self.darkGreen, nil];
    for (UIButton *button in colorbuttons) {
        button.layer.cornerRadius = button.bounds.size.width/2;
    }
}

- (IBAction)doneSelected:(id)sender {
    [self saveOptions]; // save user selected options prior to returning to clock.
    [self performSegueWithIdentifier:@"updateOptions" sender:self];
}

- (IBAction)lightGreenSelected:(id)sender {
    self.clockColor = @1;
    [sender setSelected:true];
    [self.red setSelected:false];
    [self.blue setSelected:false];
    [self.darkGreen setSelected:false];
}

- (IBAction)redSelected:(id)sender {
    self.clockColor = @2;
    [sender setSelected:true];
    [self.lightGreen setSelected:false];
    [self.blue setSelected:false];
    [self.darkGreen setSelected:false];
}

- (IBAction)blueSelected:(id)sender {
    self.clockColor = @3;
    [sender setSelected:true];
    [self.lightGreen setSelected:false];
    [self.red setSelected:false];
    [self.darkGreen setSelected:false];
}

- (IBAction)darkGreenSelected:(id)sender {
    self.clockColor = @4;
    [sender setSelected:true];
    [self.lightGreen setSelected:false];
    [self.red setSelected:false];
    [self.blue setSelected:false];
}

- (void) saveOptions {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.clockColor forKey:@"colorSelected"];
    
}

@end
