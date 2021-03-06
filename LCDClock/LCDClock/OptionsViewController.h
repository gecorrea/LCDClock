//  OptionsViewController.h
//  LCDClock

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Utilities.h"

@interface OptionsViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *lightGreen;
@property (weak, nonatomic) IBOutlet UIButton *red;
@property (weak, nonatomic) IBOutlet UIButton *blue;
@property (weak, nonatomic) IBOutlet UIButton *darkGreen;
@property (weak, nonatomic) IBOutlet UIButton *timeZoneButton;
@property NSNumber *clockColor;
@property (weak, nonatomic) IBOutlet UISwitch *clockFormatSwitch;
@property NSNumber *clockFormat;
@property (weak, nonatomic) IBOutlet UIPickerView *timeZonePicker;
@property NSArray *timeZones;


// for userSettings.plist
@property NSMutableArray *formatArray;
@property NSMutableArray *colorArray;
@property NSMutableArray *timeZoneArray;
@property NSMutableDictionary *plistDict;

@end
