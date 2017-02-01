//  ViewController.h
//  LCDClock

#import <UIKit/UIKit.h>
#import "digit.h"
#import "amPM.h"

@interface ViewController : UIViewController
@property UIView *digitView;
@property (weak, nonatomic) IBOutlet UIView *dotView;
@property (weak, nonatomic) IBOutlet UIView *topDot;
@property (weak, nonatomic) IBOutlet UIView *bottomDot;
@property NSMutableArray *backgroundPictures;
@property UIImage *backgroundImage;
@property int backgroundImageIndex;
@property UIDeviceOrientation currentDeviceOrienation;
@property (weak, nonatomic) IBOutlet UIButton *options;
@property (weak, nonatomic) IBOutlet digit *firstHourDigit;
@property (weak, nonatomic) IBOutlet digit *secondHourDigit;
@property (weak, nonatomic) IBOutlet digit *firstMinuteDigit;
@property (weak, nonatomic) IBOutlet digit *secondMinuteDigit;
@property (weak, nonatomic) IBOutlet digit *firstSecondDigit;
@property (weak, nonatomic) IBOutlet digit *secondSecondDigit;
@property (weak, nonatomic) IBOutlet amPM *amPm;
@property (weak, nonatomic) IBOutlet UIStackView *clockView;


- (IBAction)showOptions:(UITapGestureRecognizer *)sender;
- (IBAction)optionsSelected:(UIButton *)sender;


@end

