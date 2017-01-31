//  amPM.h
//  LCDClock

#import <UIKit/UIKit.h>

@interface amPM : UIView

@property (weak, nonatomic) IBOutlet UIView *topASegment;
@property (weak, nonatomic) IBOutlet UIView *topLeftASegment;
@property (weak, nonatomic) IBOutlet UIView *topRightASegment;
@property (weak, nonatomic) IBOutlet UIView *middleASegment;
@property (weak, nonatomic) IBOutlet UIView *bottomLeftASegment;
@property (weak, nonatomic) IBOutlet UIView *bottomRightASegment;
@property (weak, nonatomic) IBOutlet UIView *topMSegment;
@property (weak, nonatomic) IBOutlet UIView *topLeftMSegment;
@property (weak, nonatomic) IBOutlet UIView *topRightMSegment;
@property (weak, nonatomic) IBOutlet UIView *topMiddleMSegment;
@property (weak, nonatomic) IBOutlet UIView *bottomLeftMSegment;
@property (weak, nonatomic) IBOutlet UIView *bottomRightMSegment;

@end
