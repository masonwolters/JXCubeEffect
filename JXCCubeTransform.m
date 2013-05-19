//
//  JXCCubeTransform.m
//  JXCubeEffect
//
//  Created by Dev on 5/18/13.
//
//

#import "JXCCubeTransform.h"
#import <QuartzCore/QuartzCore.h>
@implementation JXCCubeTransform
-(void)transform:(float)angle x:(float)x y:(float)y z:(float)z inView:(UIView*)View{
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform.m34 = 1.0 / -500;
    rotationAndPerspectiveTransform =
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform,angle * M_PI / 2, x, y, z);
    View.layer.transform = rotationAndPerspectiveTransform;
    View.layer.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
    
}
@end
