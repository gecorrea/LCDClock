//  digit.m
//  LCDClock

#import "digit.h"

@implementation digit

-(id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"digit" owner:self options:nil] objectAtIndex:0];
        [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(updateView) userInfo:nil repeats:true];
        view.frame = self.bounds;
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:view];
    }
    return self;
}

- (void) updateView {
    
    // take all the UIViews and make them into an array
    NSArray *clockViews = [[NSArray alloc] initWithObjects:self.topSegment, self.topLeftSegment, self.topRightSegment, self.middleSegment, self.bottomLeftSegment, self.bottomRightSegment, self.bottomSegment, nil];
    
    // use for in loop to traverse the array and make the corners triangular
    for (UIView *view in clockViews) {
        view.layer.cornerRadius = self.bounds.size.width/5;
    }
    
    // set the user selected color from options for the digits
    NSUserDefaults *savedOptions = [NSUserDefaults standardUserDefaults];
    int color = [[savedOptions objectForKey:@"colorSelected"] intValue];
    switch (color) {
        case 1:
            for (UIView *view in clockViews) {
                [view setBackgroundColor:[self colorWithHexString:@"07F53E"]];
            }
            break;
            
        case 2:
            for (UIView *view in clockViews) {
                [view setBackgroundColor:[self colorWithHexString:@"FE0000"]];
            }
            break;
            
        case 3:
            for (UIView *view in clockViews) {
                [view setBackgroundColor:[self colorWithHexString:@"437EF3"]];
            }
            break;
            
        case 4:
            for (UIView *view in clockViews) {
                [view setBackgroundColor:[self colorWithHexString:@"359B5D"]];
            }
            break;
            
        default:
            for (UIView *view in clockViews) {
                [view setBackgroundColor:[self colorWithHexString:@"000000"]];
            }
            break;
    }
}

- (UIColor *) colorWithHexString:(NSString *) hex {
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

- (void) makeDigits:(NSString *) convertDigit {
    int digitToMake = [convertDigit intValue];
    
    switch (digitToMake) {
        case 0:
            [self.topSegment setHidden:false];
            [self.topLeftSegment setHidden:false];
            [self.topRightSegment setHidden:false];
            [self.middleSegment setHidden:true];
            [self.bottomLeftSegment setHidden:false];
            [self.bottomRightSegment setHidden:false];
            [self.bottomSegment setHidden:false];
            break;
            
        case 1:
            [self.topSegment setHidden:true];
            [self.topLeftSegment setHidden:true];
            [self.topRightSegment setHidden:false];
            [self.middleSegment setHidden:true];
            [self.bottomLeftSegment setHidden:true];
            [self.bottomRightSegment setHidden:false];
            [self.bottomSegment setHidden:false];
            break;
            
        case 2:
            [self.topSegment setHidden:false];
            [self.topLeftSegment setHidden:true];
            [self.topRightSegment setHidden:false];
            [self.middleSegment setHidden:false];
            [self.bottomLeftSegment setHidden:false];
            [self.bottomRightSegment setHidden:true];
            [self.bottomSegment setHidden:false];
            break;
            
        case 3:
            [self.topSegment setHidden:false];
            [self.topLeftSegment setHidden:true];
            [self.topRightSegment setHidden:false];
            [self.middleSegment setHidden:false];
            [self.bottomLeftSegment setHidden:true];
            [self.bottomRightSegment setHidden:false];
            [self.bottomSegment setHidden:false];
            break;
            
        case 4:
            [self.topSegment setHidden:true];
            [self.topLeftSegment setHidden:false];
            [self.topRightSegment setHidden:false];
            [self.middleSegment setHidden:false];
            [self.bottomLeftSegment setHidden:true];
            [self.bottomRightSegment setHidden:false];
            [self.bottomSegment setHidden:true];
            break;
            
        case 5:
            [self.topSegment setHidden:false];
            [self.topLeftSegment setHidden:false];
            [self.topRightSegment setHidden:true];
            [self.middleSegment setHidden:false];
            [self.bottomLeftSegment setHidden:true];
            [self.bottomRightSegment setHidden:false];
            [self.bottomSegment setHidden:false];
            break;
            
        case 6:
            [self.topSegment setHidden:false];
            [self.topLeftSegment setHidden:false];
            [self.topRightSegment setHidden:true];
            [self.middleSegment setHidden:false];
            [self.bottomLeftSegment setHidden:false];
            [self.bottomRightSegment setHidden:false];
            [self.bottomSegment setHidden:false];
            break;
            
        case 7:
            [self.topSegment setHidden:false];
            [self.topLeftSegment setHidden:true];
            [self.topRightSegment setHidden:false];
            [self.middleSegment setHidden:true];
            [self.bottomLeftSegment setHidden:true];
            [self.bottomRightSegment setHidden:false];
            [self.bottomSegment setHidden:true];
            break;
            
        case 8:
            [self.topSegment setHidden:false];
            [self.topLeftSegment setHidden:false];
            [self.topRightSegment setHidden:false];
            [self.middleSegment setHidden:false];
            [self.bottomLeftSegment setHidden:false];
            [self.bottomRightSegment setHidden:false];
            [self.bottomSegment setHidden:false];
            break;
            
        case 9:
            [self.topSegment setHidden:false];
            [self.topLeftSegment setHidden:false];
            [self.topRightSegment setHidden:false];
            [self.middleSegment setHidden:false];
            [self.bottomLeftSegment setHidden:true];
            [self.bottomRightSegment setHidden:false];
            [self.bottomSegment setHidden:true];
            break;
            
        default:
            break;
    }
}

@end
