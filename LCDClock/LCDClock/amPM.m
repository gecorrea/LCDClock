//  amPM.m
//  LCDClock

#import "amPM.h"

@implementation amPM

-(id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"amPM" owner:self options:nil] objectAtIndex:0];
        [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(updateView) userInfo:nil repeats:true];
        view.frame = self.bounds;
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:view];
    }
    return self;
}

- (void) updateView {
    // take all the UIViews and make them into an array
    NSArray *amPMViews = [[NSArray alloc] initWithObjects:self.topASegment, self.topLeftASegment, self.topRightASegment, self.middleASegment, self.bottomLeftASegment, self.bottomRightASegment, self.topMSegment, self.topLeftMSegment, self.topRightMSegment, self.topMiddleMSegment, self.bottomLeftMSegment, self.bottomRightMSegment, nil];
    
    // use for in loop to traverse the array and make the corners triangular
    for (UIView *view in amPMViews) {
        view.layer.cornerRadius = self.bounds.size.width/8;
    }
    
    // set the user selected color from options for the digits
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int color = [[defaults objectForKey:@"colorSelected"] intValue];
    switch (color) {
        case 1:
            for (UIView *view in amPMViews) {
            [view setBackgroundColor:[self colorWithHexString:@"07F53E"]];
            }
            break;
            
        case 2:
            for (UIView *view in amPMViews) {
                [view setBackgroundColor:[self colorWithHexString:@"FE0000"]];
            }
            break;
            
        case 3:
            for (UIView *view in amPMViews) {
                [view setBackgroundColor:[self colorWithHexString:@"437EF3"]];
            }
            break;
            
        case 4:
            for (UIView *view in amPMViews) {
                [view setBackgroundColor:[self colorWithHexString:@"359B5D"]];
            }
            break;
            
        default:
            for (UIView *view in amPMViews) {
                [view setBackgroundColor:[self colorWithHexString:@"000000"]];
            }
            break;
    }
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

- (void) makeLetters:(NSString *) lettersToMake {
    if ([lettersToMake isEqualToString:@"AM"]) {
        [self.bottomRightASegment setHidden:false];
    }
    else {
        [self.bottomRightASegment setHidden:true];
    }

}

@end
