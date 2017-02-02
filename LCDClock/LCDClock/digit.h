//  digit.h
//  LCDClock

#import <UIKit/UIKit.h>

@interface digit : UIView

@property (weak, nonatomic) IBOutlet UIView *topSegment;
@property (weak, nonatomic) IBOutlet UIView *topLeftSegment;
@property (weak, nonatomic) IBOutlet UIView *topRightSegment;
@property (weak, nonatomic) IBOutlet UIView *middleSegment;
@property (weak, nonatomic) IBOutlet UIView *bottomLeftSegment;
@property (weak, nonatomic) IBOutlet UIView *bottomRightSegment;
@property (weak, nonatomic) IBOutlet UIView *bottomSegment;

- (void) makeDigit:(int) digitToMake;

@end
