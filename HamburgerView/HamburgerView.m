//
//  HamburgerView.m
//
//  Code generated using QuartzCode on 5/08/14.
//  www.quartzcodeapp.com
//

#import "HamburgerView.h"

@interface HamburgerView ()

@property (nonatomic, strong) CAShapeLayer *oval;
@property (nonatomic, strong) CAShapeLayer *middle;
@property (nonatomic, strong) CAShapeLayer *top;
@property (nonatomic, strong) CAShapeLayer *bottom;

@end

@implementation HamburgerView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupLayers];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setupLayers];
	}
	return self;
}


- (void)setupLayers{
	_oval = [CAShapeLayer layer];
	_oval.frame = CGRectMake(80, 160, 160, 160);
	_oval.lineCap = kCALineCapRound;
	_oval.lineJoin = kCALineJoinRound;
	_oval.fillColor = [UIColor colorWithRed:0.922 green: 0.922 blue:0.922 alpha:0].CGColor;
	_oval.strokeColor = [UIColor colorWithRed:0.19 green: 0.882 blue:0.37 alpha:1].CGColor;
	_oval.lineWidth = 14;
	_oval.path = [self ovalPath].CGPath;
	[self.layer addSublayer:_oval];
	
	_middle = [CAShapeLayer layer];
	_middle.frame = CGRectMake(119.6, 160, 118.4, 80.004);
	_middle.lineCap = kCALineCapRound;
	_middle.lineJoin = kCALineJoinRound;
	_middle.fillColor = [UIColor colorWithRed:0.922 green: 0.922 blue:0.922 alpha:0].CGColor;
	_middle.strokeColor = [UIColor colorWithRed:0.19 green: 0.882 blue:0.37 alpha:1].CGColor;
	_middle.lineWidth = 14;
	_middle.strokeEnd = 0;
	_middle.path = [self middlePath].CGPath;
	[self.layer addSublayer:_middle];
	
	_top = [CAShapeLayer layer];
	_top.frame = CGRectMake(120, 240, 80, 0);
	[_top setValue:@-0.785 forKeyPath:@"transform.rotation"];
	_top.lineCap = kCALineCapRound;
	_top.lineJoin = kCALineJoinRound;
	_top.fillColor = [UIColor colorWithRed:0.922 green: 0.922 blue:0.922 alpha:0].CGColor;
	_top.strokeColor = [UIColor colorWithRed:0.19 green: 0.882 blue:0.37 alpha:1].CGColor;
	_top.lineWidth = 14;
	_top.path = [self topPath].CGPath;
	[self.layer addSublayer:_top];
	
	_bottom = [CAShapeLayer layer];
	_bottom.frame = CGRectMake(120, 240, 80, 0);
	[_bottom setValue:@0.785 forKeyPath:@"transform.rotation"];
	_bottom.lineCap = kCALineCapRound;
	_bottom.lineJoin = kCALineJoinRound;
	_bottom.fillColor = [UIColor colorWithRed:0.922 green: 0.922 blue:0.922 alpha:0].CGColor;
	_bottom.strokeColor = [UIColor colorWithRed:0.19 green: 0.882 blue:0.37 alpha:1].CGColor;
	_bottom.lineWidth = 14;
	_bottom.path = [self bottomPath].CGPath;
	[self.layer addSublayer:_bottom];
}


- (IBAction)startAllAnimations:(id)sender{
	[self.oval addAnimation:[self ovalAnimation] forKey:@"ovalAnimation"];
	[self.middle addAnimation:[self middleAnimation] forKey:@"middleAnimation"];
	[self.top addAnimation:[self topAnimation] forKey:@"topAnimation"];
	[self.bottom addAnimation:[self bottomAnimation] forKey:@"bottomAnimation"];
	[self updateValueFromAnimationsForLayers:@[self.oval, self.middle, self.top, self.bottom]];
}


- (CABasicAnimation*)ovalAnimation{
	CABasicAnimation *strokeEndAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	strokeEndAnim.fromValue = @1;
	strokeEndAnim.toValue = @-0.1;
	strokeEndAnim.duration = 0.984;
	
	return strokeEndAnim;
}



- (CAAnimationGroup*)middleAnimation{
	CABasicAnimation *strokeEndAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	strokeEndAnim.fromValue = @0;
	strokeEndAnim.toValue = @1;
	strokeEndAnim.duration = 0.484;
	strokeEndAnim.beginTime = 0.569;
	
	CABasicAnimation *strokeStartAnim = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
	strokeStartAnim.fromValue = @0;
	strokeStartAnim.toValue = @0.657;
	strokeStartAnim.duration = 0.489;
	strokeStartAnim.beginTime = 0.868;
	
	CAAnimationGroup *middleAnim = [CAAnimationGroup animation];
	middleAnim.animations = @[strokeEndAnim, strokeStartAnim];
	[middleAnim.animations setValue:kCAFillModeBackwards forKeyPath:@"fillMode"];
	
	middleAnim.duration = [self maxDurationFromAnimations:middleAnim.animations];
	
	return middleAnim;
}



- (CAAnimationGroup*)topAnimation{
	CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
	transformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, -1)];;
	transformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, -24, 0)];;
	transformAnim.duration = 0.8;
	transformAnim.beginTime = 0.5;
	transformAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.25 :0.1 :0.65 :1.37];
	
	CAAnimationGroup *topAnim = [CAAnimationGroup animation];
	topAnim.animations = @[transformAnim];
	[topAnim.animations setValue:kCAFillModeBackwards forKeyPath:@"fillMode"];
	
	topAnim.duration = [self maxDurationFromAnimations:topAnim.animations];
	
	return topAnim;
}



- (CAAnimationGroup*)bottomAnimation{
	CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
	transformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-0.785, 0, 0, -1)];;
	transformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 24, 0)];;
	transformAnim.duration = 0.8;
	transformAnim.beginTime = 0.5;
	transformAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.25 :0.1 :0.65 :1.37];
	
	CAAnimationGroup *bottomAnim = [CAAnimationGroup animation];
	bottomAnim.animations = @[transformAnim];
	[bottomAnim.animations setValue:kCAFillModeBackwards forKeyPath:@"fillMode"];
	
	bottomAnim.duration = [self maxDurationFromAnimations:bottomAnim.animations];
	
	return bottomAnim;
}

#pragma mark - Bezier Path


- (UIBezierPath*)ovalPath{
	UIBezierPath *ovalPath = [UIBezierPath bezierPath];
	[ovalPath moveToPoint:CGPointMake(80, 0)];
	[ovalPath addCurveToPoint:CGPointMake(0, 80) controlPoint1:CGPointMake(35.817, 0) controlPoint2:CGPointMake(0, 35.817)];
	[ovalPath addCurveToPoint:CGPointMake(80, 160) controlPoint1:CGPointMake(0, 124.183) controlPoint2:CGPointMake(35.817, 160)];
	[ovalPath addCurveToPoint:CGPointMake(160, 80) controlPoint1:CGPointMake(124.183, 160) controlPoint2:CGPointMake(160, 124.183)];
	[ovalPath addCurveToPoint:CGPointMake(80, 0) controlPoint1:CGPointMake(160, 35.817) controlPoint2:CGPointMake(124.183, 0)];
	
	return ovalPath;
}


- (UIBezierPath*)middlePath{
	UIBezierPath *middlePath = [UIBezierPath bezierPath];
	[middlePath moveToPoint:CGPointMake(41.314, 0)];
	[middlePath addCurveToPoint:CGPointMake(117.882, 56.746) controlPoint1:CGPointMake(77.409, 0) controlPoint2:CGPointMake(107.921, 23.904)];
	[middlePath addCurveToPoint:CGPointMake(92.206, 80) controlPoint1:CGPointMake(120.114, 64.104) controlPoint2:CGPointMake(115.776, 80.281)];
	[middlePath addLineToPoint:CGPointMake(0, 80)];
	[middlePath moveToPoint:CGPointMake(41.314, 0)];
	
	return middlePath;
}


- (UIBezierPath*)topPath{
	UIBezierPath *topPath = [UIBezierPath bezierPath];
	[topPath moveToPoint:CGPointMake(0, 0)];
	[topPath addLineToPoint:CGPointMake(80, 0)];
	
	return topPath;
}


- (UIBezierPath*)bottomPath{
	UIBezierPath *bottomPath = [UIBezierPath bezierPath];
	[bottomPath moveToPoint:CGPointMake(0, 0)];
	[bottomPath addLineToPoint:CGPointMake(80, 0)];
	
	return bottomPath;
}

#pragma mark - Others

- (void)updateValueFromAnimationsForLayers:(NSArray*)layers{
	for (CALayer *layer in layers) {
		[self updateValueFromAnimationsForLayer:layer];
	}
}

- (void)updateValueFromAnimationsForLayer:(CALayer*)layer{
	[CATransaction begin];
	[CATransaction setDisableActions:YES];
	
	void (^__block updateValueForAnim)(CAAnimation *) = ^(CAAnimation *anim){
		if ([anim isKindOfClass:[CABasicAnimation class]]) {
			CABasicAnimation *basicAnim = (CABasicAnimation*)anim;
			[layer setValue:basicAnim.toValue forKey:basicAnim.keyPath];
		}
		else if ([anim isKindOfClass:[CAKeyframeAnimation class]]) {
			CAKeyframeAnimation *keyAnim = (CAKeyframeAnimation*)anim;
			[layer setValue:keyAnim.values.lastObject forKey:keyAnim.keyPath];
		}
		else if ([anim isKindOfClass:[CAAnimationGroup class]]) {
			CAAnimationGroup *groupAnim = (CAAnimationGroup*)anim;
			for (CAAnimation *subAnim in groupAnim.animations) {
				updateValueForAnim(subAnim);
			}
		}
	};
	for (NSString *animKey in layer.animationKeys) {
		CAAnimation *anim = [layer animationForKey:animKey];
		updateValueForAnim(anim);
	}
	
	[CATransaction commit];
}
- (CGFloat)maxDurationFromAnimations:(NSArray*)anims{
	CGFloat maxDuration = 0;
	for (CAAnimation *anim in anims) {
		maxDuration = MAX(anim.beginTime + anim.duration * (CGFloat)(anim.repeatCount == 0 ? 1.0f : anim.repeatCount) * (anim.autoreverses ? 2.0f : 1.0f), maxDuration);
	}
	if (maxDuration == INFINITY) {
		maxDuration = 1000.0f;
	}
	
	return maxDuration;
}
@end