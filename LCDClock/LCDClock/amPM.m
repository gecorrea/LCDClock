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
    self.topASegment.layer.cornerRadius = self.bounds.size.width/8;
    self.topLeftASegment.layer.cornerRadius = self.bounds.size.width/8;
    self.topRightASegment.layer.cornerRadius = self.bounds.size.width/8;
    self.middleASegment.layer.cornerRadius = self.bounds.size.width/8;
    self.bottomLeftASegment.layer.cornerRadius = self.bounds.size.width/8;
    self.bottomRightASegment.layer.cornerRadius = self.bounds.size.width/8;
    
    self.topMSegment.layer.cornerRadius = self.bounds.size.width/8;
    self.topLeftMSegment.layer.cornerRadius = self.bounds.size.width/8;
    self.topRightMSegment.layer.cornerRadius = self.bounds.size.width/8;
    self.topMiddleMSegment.layer.cornerRadius = self.bounds.size.width/8;
    self.bottomLeftMSegment.layer.cornerRadius = self.bounds.size.width/8;
    self.bottomRightMSegment.layer.cornerRadius = self.bounds.size.width/8;
}

@end
