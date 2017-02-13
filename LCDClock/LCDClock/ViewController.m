//  ViewController.m
//  LCDClock

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad {
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    
    [self.date setFont:[UIFont fontWithName:@"digital-7" size:20]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"EEEE MMMM d"];
//    [self.date setText:[formatter stringFromDate:[NSDate date]]];
    self.date.text =[formatter stringFromDate:[NSDate date]];
    

    [self loadBackgroundImages];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.backgroundImageIndex = [[defaults objectForKey:@"lastBackground"] intValue];
    [self backgroundView];

    [self loadSeparator];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(blinkSeparator) userInfo:nil repeats:true];
    
//    [NSTimeZone setDefaultTimeZone:[NSTimeZone timeZoneWithAbbreviation:[defaults objectForKey:@"timeZoneSelected"]]];
    [NSTimeZone setDefaultTimeZone:[NSTimeZone timeZoneWithAbbreviation:[Utilities getPlistDictionaryObjectForKey:@"timeZone"]]];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runClock) userInfo:nil repeats:true];
}

- (void) loadBackgroundImages {
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
    
    self.backgroundPictures = [[NSMutableArray alloc] initWithObjects:image1, image2, image3, image4, image5, image6, image7, image8, image9, image10, nil];
}

- (void) backgroundView {
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.backgroundPictures[self.backgroundImageIndex] drawInRect:self.view.bounds];
    self.backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:self.backgroundImage];
    NSUserDefaults *currentBackground = [NSUserDefaults standardUserDefaults];
    NSNumber *lastBackgoundIndex = [NSNumber numberWithInt:self.backgroundImageIndex];
    [currentBackground setObject:lastBackgoundIndex forKey:@"lastBackground"];
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
    
    [self backgroundView];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self backgroundView];
    [self loadSeparator];
}

- (void) loadSeparator {
    NSArray *dotViews = [[NSArray alloc] initWithObjects:self.topDot, self.bottomDot, nil];
    for (UIView *view in dotViews) {
        view.layer.cornerRadius = view.bounds.size.width/2;
    }

    // set the user selected color from options for the digits
    NSUserDefaults *defualts = [NSUserDefaults standardUserDefaults];
    int color = [[defualts objectForKey:@"colorSelected"] intValue];
    switch (color) {
        case 1:
            for (UIView *view in dotViews) {
                [view setBackgroundColor:[self colorWithHexString:@"07F53E"]];
            }
            break;
            
        case 2:
            for (UIView *view in dotViews) {
                [view setBackgroundColor:[self colorWithHexString:@"FE0000"]];
            }
            break;
            
        case 3:
            for (UIView *view in dotViews) {
                [view setBackgroundColor:[self colorWithHexString:@"437EF3"]];
            }
            break;
            
        case 4:
            for (UIView *view in dotViews) {
                [view setBackgroundColor:[self colorWithHexString:@"359B5D"]];
            }
            break;
            
        default:
            for (UIView *view in dotViews) {
                [view setBackgroundColor:[self colorWithHexString:@"000000"]];
            }
            break;
    }
    self.date.textColor = self.topDot.backgroundColor;
}

- (void) blinkSeparator {
    self.topDot.hidden = !self.topDot.hidden;
    self.bottomDot.hidden = !self.bottomDot.hidden;
}

- (void) runClock {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int clockFormat = [[defaults objectForKey:@"formatSelected"] intValue];
//    int clockFormat = [[Utilities getPlistDictionaryObjectForKey:@"clockFormat"] intValue];
    if (clockFormat == 0) {
        [dateFormatter setDateFormat:@"a"];
        NSString *timeLetters = [dateFormatter stringFromDate:[NSDate date]];
        [self.amPm makeLetters:timeLetters];
        [dateFormatter setDateFormat:@"hhmmss"];
    }
    else {
        [dateFormatter setDateFormat:@"HHmmss"];
    }
    
    NSString *time = [dateFormatter stringFromDate:[NSDate date]];
    int convertTime = [time intValue];
    
    int currentDigit = (convertTime - (convertTime % 100000))/100000;
    
    if (currentDigit == 0)
        currentDigit = 10;
    [self.firstHourDigit makeDigit:currentDigit];
    if (currentDigit != 10) {
        convertTime = convertTime - 100000;
    }
    currentDigit = (convertTime - (convertTime % 10000))/10000;
    [self.secondHourDigit makeDigit:currentDigit];
    convertTime = convertTime - (currentDigit * 10000);
    currentDigit = (convertTime - (convertTime % 1000))/1000;
    [self.firstMinuteDigit makeDigit:currentDigit];
    convertTime = convertTime - (currentDigit * 1000);
    currentDigit = (convertTime - (convertTime % 100))/100;
    [self.secondMinuteDigit makeDigit:currentDigit];
    convertTime = (convertTime - (currentDigit * 100));
    currentDigit = (convertTime - (convertTime % 10))/10;
    [self.firstSecondDigit makeDigit:currentDigit];
    convertTime = (convertTime - (currentDigit * 10));
    currentDigit = convertTime;
    [self.secondSecondDigit makeDigit:currentDigit];
}

-(UIColor *) colorWithHexString:(NSString *) hex {
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (IBAction)showOptions:(UITapGestureRecognizer *)sender {
    [self.options setHidden:false];
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(hideOptions) userInfo:nil repeats:false];
}

- (void)hideOptions {
    [self.options setHidden:true];
}

- (IBAction)optionsSelected:(UIButton *)sender {
    [self performSegueWithIdentifier:@"optionsSelected" sender:self];
}

@end
