//  ViewController.m
//  LCDClock

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image1 = [UIImage imageNamed:@"img-clock-background-1"];
    UIImage *image2 = [UIImage imageNamed:@"img-clock-background-2"];
    UIImage *image3 = [UIImage imageNamed:@"img-clock-background-3"];
    UIImage *image4 = [UIImage imageNamed:@"img-clock-background-4"];
    UIImage *image5 = [UIImage imageNamed:@"img-clock-background-5"];
    UIImage *image6 = [UIImage imageNamed:@"img-clock-background-6"];
    UIImage *image7 = [UIImage imageNamed:@"img-clock-background-7"];
    UIImage *image8 = [UIImage imageNamed:@"img-clock-background-8"];
    UIImage *image9 = [UIImage imageNamed:@"img-clock-background-9"];
    UIImage *image10 = [UIImage imageNamed:@"img-clock-background-10"];
    self.backgroundImageIndex = 0;
    self.backgroundPictures = [[NSMutableArray alloc] initWithObjects:image1, image2, image3, image4, image5, image6, image7, image8, image9, image10, nil];
    
    [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(updateView) userInfo:nil repeats:true];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(blinkSeparator) userInfo:nil repeats:true];
}

- (void) updateView {
    self.topDot.layer.cornerRadius = self.topDot.bounds.size.width/2;
    self.bottomDot.layer.cornerRadius = self.bottomDot.bounds.size.width/2;
    [self backgroundView];
}

- (void) backgroundView {
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.backgroundPictures[self.backgroundImageIndex] drawInRect:self.view.bounds];
    self.backgroudImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:self.backgroudImage];
}

- (void) blinkSeparator {
    self.topDot.hidden = !self.topDot.hidden;
    self.bottomDot.hidden = !self.bottomDot.hidden;
}

- (IBAction)showOptions:(UITapGestureRecognizer *)sender {
    [self.options setHidden:false];
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(hideOptions) userInfo:nil repeats:false];
}

- (void)hideOptions {
    [self.options setHidden:true];
}

- (IBAction)changeBackground:(UISwipeGestureRecognizer *)sender {
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft)
        self.backgroundImageIndex += 1;
    else if(sender.direction == UISwipeGestureRecognizerDirectionRight)
        self.backgroundImageIndex -= 1;
    
    if (self.backgroundImageIndex == -1)
        self.backgroundImageIndex = 9;
    else if (self.backgroundImageIndex == 10)
        self.backgroundImageIndex = 0;
}

- (IBAction)selectOptions:(UITapGestureRecognizer *)sender {
    if (self.options.isHidden == false)
        [self performSegueWithIdentifier:@"optionsSelected" sender:self];
}
@end
