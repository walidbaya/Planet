


#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "OpenGLCommon.h"

@class GLView;
@interface GLViewController : UIViewController {
    Vertex3D    *sphereTriangleStripVertices;
    Vector3D    *sphereTriangleStripNormals;
    GLuint      sphereTriangleStripVertexCount;
    UILabel     *txtlabel;
    Vertex3D    *sphereTriangleFanVertices;
    Vector3D    *sphereTriangleFanNormals;
    GLuint      sphereTriangleFanVertexCount;
}
- (void)drawView:(GLView*)view;
- (void)setupView:(GLView*)view;

#pragma mark -

-(void)tapped;
-(void)pan:(UIPanGestureRecognizer *)p;
-(void)pinch:(UIPinchGestureRecognizer *)p;


@end
