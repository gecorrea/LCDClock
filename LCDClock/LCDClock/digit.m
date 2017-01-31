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
    self.topSegment.layer.cornerRadius = self.bounds.size.width/5;
    self.topLeftSegment.layer.cornerRadius = self.bounds.size.width/5;
    self.topRightSegment.layer.cornerRadius = self.bounds.size.width/5;
    self.middleSegment.layer.cornerRadius = self.bounds.size.width/5;
    self.bottomLeftSegment.layer.cornerRadius = self.bounds.size.width/5;
    self.bottomRightSegment.layer.cornerRadius = self.bounds.size.width/5;
    self.bottomSegment.layer.cornerRadius = self.bounds.size.width/5;
}

@end
