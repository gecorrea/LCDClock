//  OptionsViewController.m
//  LCDClock

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController


- (void) viewDidLoad {
    NSArray *colorbuttons = [[NSArray alloc] initWithObjects:self.lightGreen, self.red, self.blue, self.darkGreen, nil];
    for (UIButton *button in colorbuttons) {
        button.layer.cornerRadius = button.bounds.size.width/2;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *color = [defaults objectForKey:@"colorSelected"];
    if ([color isEqual:@1])
        [self.lightGreen setSelected:true];
    else if([color isEqual:@2])
        [self.red setSelected:true];
    else if ([color isEqual:@3])
        [self.blue setSelected:true];
    else if ([color isEqual:@4])
        [self.darkGreen setSelected:true];
    
    NSNumber *format = [defaults objectForKey:@"formatSelected"];
    if ([format isEqual:@1]) {
        [self.clockFormatSwitch setOn:YES animated:YES];
    }
    
    self.timeZones = [[NSArray alloc] initWithObjects:@"Eastern Standard Time", @"Central Standard Time", @"Mountain Standard Time", @"Pacific Standard Time", @"Alaska Standard Time", @"Hawaii-Aleutian Standard Time", nil];
    
    self.timeZonePicker.delegate = self;
    self.timeZonePicker.dataSource = self;
    [self.timeZonePicker setShowsSelectionIndicator:YES];
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

- (IBAction)changeFormat:(UISwitch *)sender {
    if ([self.clockFormatSwitch isOn]) {
        self.clockFormat = @1; // 24 hour format
    }
    else {
        self.clockFormat = @0; // 12 hour format
    }
}


- (IBAction)changeTimeZone:(UIButton *)sender {
    [self.timeZonePicker setHidden:false];
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *strTitle = self.timeZones[row];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:strTitle attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.timeZones count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.timeZones objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    //Here, like the table view you can get the each section of each row if you've multiple sections
    NSLog(@"Selected Time Zone: %@.", self.timeZones[row]);
    [self.timeZoneButton setTitle:self.timeZones[row] forState:UIControlStateNormal];
    [self.timeZonePicker setHidden:true];
}

- (void) saveOptions {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.clockColor forKey:@"colorSelected"];
    [defaults setObject:self.clockFormat forKey:@"formatSelected"];
}

@end
