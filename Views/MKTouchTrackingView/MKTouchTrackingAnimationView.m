//
//  MKTouchTrackingAnimationView.m
//
// Copyright 2013 Michael F. Kamprath
// michael@claireware.com
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "MKTouchTrackingAnimationView.h"

@implementation MKTouchTrackingAnimationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)setAnimationLayer:(MKSoundCoordinatedAnimationLayer *)inAnimationLayer {
    
    if ( nil != _animationLayer ) {
        [_animationLayer removeFromSuperlayer];
        _animationLayer = nil;
    }
    
    
    if ( nil != inAnimationLayer) {
        _animationLayer = inAnimationLayer;
        [self.layer addSublayer:_animationLayer];
    }
}

#pragma mark - Touch Tracking

-(BOOL)isPtInViewCoreArea:(CGPoint)inPt {
    CALayer* presentationLayer = [self.animationLayer presentationLayer];
    
    CGRect currentFrame = presentationLayer.frame;
    
    
	return CGRectContainsPoint(currentFrame, inPt);
}

-(BOOL)isPtInViewTrackingArea:(CGPoint)inPt {
    CALayer* presentationLayer = [self.layer presentationLayer];
    
    CGRect currentFrame = presentationLayer.frame;
    
	CGRect trackingRect = CGRectInset( currentFrame, -currentFrame.size.width, -currentFrame.size.height );
    
	return CGRectContainsPoint(trackingRect, inPt);
}

@end