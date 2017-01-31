//  ViewController.h
//  LCDClock

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController
@property UIView *digitView;
@property (weak, nonatomic) IBOutlet UIImageView *options;
@property (weak, nonatomic) IBOutlet UIView *dotView;
@property (weak, nonatomic) IBOutlet UIView *topDot;
@property (weak, nonatomic) IBOutlet UIView *bottomDot;
@property NSMutableArray *backgroundPictures;
@property UIImage *backgroudImage;
@property int backgroundImageIndex;

- (IBAction)showOptions:(UITapGestureRecognizer *)sender;

@end

