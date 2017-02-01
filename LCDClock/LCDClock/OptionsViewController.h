//  OptionsViewController.h
//  LCDClock

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface OptionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *lightGreen;
@property (weak, nonatomic) IBOutlet UIButton *red;
@property (weak, nonatomic) IBOutlet UIButton *blue;
@property (weak, nonatomic) IBOutlet UIButton *darkGreen;
@property (weak, nonatomic) IBOutlet UIButton *timeZoneButton;
@property NSNumber *clockColor;

@end
