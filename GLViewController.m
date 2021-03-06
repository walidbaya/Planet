

#import "GLViewController.h"
#import "GLView.h"
#import "ConstantsAndMacros.h"
#import <QuartzCore/QuartzCore.h>


typedef struct {
	GLfloat s;
	GLfloat t;
} Texture2D;

static inline Texture2D Texture2DMake(GLfloat inS, GLfloat inT)
{
	Texture2D ret;
	ret.s = inS;
	ret.t = inT;
	return ret;
}

#define RADIUS 64

#define LAT RADIUS
#define LONG RADIUS

Texture2D texCoords[LAT*LONG*3];
// =========================================================
void getSolidSphere(Vertex3D **triangleStripVertexHandle,   // Will hold vertices to be drawn as a triangle strip.
					//      Calling code responsible for freeing if not NULL
                    Vector3D **triangleStripNormalHandle,   // Will hold normals for vertices to be drawn as triangle 
					//      strip. Calling code is responsible for freeing if 
					//      not NULL
                    GLuint *triangleStripVertexCount,       // On return, will hold the number of vertices contained in
					//      triangleStripVertices
					
                    GLfloat radius,                         // The radius of the circle to be drawn
                    GLuint slices,                          // The number of slices, determines vertical "resolution"
                    GLuint stacks)                          // the number of stacks, determines horizontal "resolution"
                                                            // =========================================================
{
    
    GLfloat  drho,  dtheta;
	
    drho = M_PI / (GLfloat) stacks;
    dtheta = 2.0 * M_PI / (GLfloat) slices;
    
    Vertex3D *triangleStripVertices;
    Vector3D *triangleStripNormals;
	
    // Normals for a sphere around the origin are darn easy - just treat the vertex as a vector and normalize it.
	
    // Calculate the triangle strip for the sphere body
    *triangleStripVertexCount = (slices + 1) * 2 * stacks;
    triangleStripVertices = calloc(*triangleStripVertexCount, sizeof(Vertex3D));
	
	int index = 0;
    int indexTex = 0;
    for (int i = 0; i < stacks; i++) {
        float rho = i * drho;
		
        for (int j = 0; j <= slices; j++) 
        {
            GLfloat theta = (j == slices) ? 0.0f : ((GLfloat)j) * dtheta;
            GLfloat x = (float)(radius * -sin(theta) * sin(rho));
            GLfloat y = (float)(radius * cos(theta) * sin(rho));
            GLfloat z = (float)(radius * cos(rho));                         
			
            triangleStripVertices[index++] = Vertex3DMake(x, y, z);
			
			GLfloat a[3] = {x, y, z};
			
			GLfloat tx1 = atan2(a[0], a[2]) / (2. * M_PI) + 0.5;
			GLfloat ty1 = asin(a[1]) / M_PI + .5;
			
			texCoords[indexTex++] = Texture2DMake(tx1, ty1);
			
            x = (float)(radius * -sin(theta) * sin(rho + drho));
            y = (float)(radius * cos(theta) * sin(rho + drho));
            z = (float)(radius * cos(rho + drho));
			
			GLfloat sx = (float)(-sin(theta) * sin(rho + drho));
			GLfloat sy = (float)(cos(theta) * sin(rho + drho));
			GLfloat sz = (float)(cos(rho + drho));
			
			triangleStripVertices[index++] = Vertex3DMake(sx, sy, sz);
			
			GLfloat b[3] = {x, y, z};
			
			
			GLfloat tx = atan2(b[0], b[2]) / (2. * M_PI) + 0.5;
			GLfloat ty = asin(b[1]) / M_PI + .5;
			
			
			if(tx < 0.75 && tx1 > 0.75)
				tx += 1.0;
			else if(tx > 0.75 && tx1 < 0.75)
				tx -= 1.0;
			
			
			texCoords[indexTex++] = Texture2DMake(tx, ty);
			
        }
    }
    
    triangleStripNormals = malloc(*triangleStripVertexCount * sizeof(Vertex3D));
    memcpy(triangleStripNormals, triangleStripVertices, *triangleStripVertexCount * sizeof(Vertex3D));
    for (int i = 0; i < *triangleStripVertexCount; i++)
		Vector3DNormalize(&triangleStripNormals[i]);
    
    *triangleStripVertexHandle = triangleStripVertices;
    *triangleStripNormalHandle = triangleStripNormals;
}
GLuint currentTexture;
GLuint earthTexture;
GLuint marsTexture;
GLuint mercureTexture;
GLuint jupiterTexture;
GLuint neptuneTexture;
GLuint plutonTexture;
GLuint saturneTexture;
GLuint soleilTexture;
GLuint uranusTexture;
GLuint venusTexture;
GLuint moonTexture;

static GLfloat rotX = 0.0;
static GLfloat rotVelX = 1.0;

static GLfloat rotY = 0.0;
static GLfloat rotVelY = 0.0;

static GLfloat pinchScale = 0.0;
static GLfloat basePinchScale = -4.0;


@implementation GLViewController
- (void)drawView:(GLView*)view;
{
	
    glLoadIdentity();
   
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) // zoom the scene out a little
		basePinchScale = -4.0;
	else
		basePinchScale = -3.0;
	
	glTranslatef(0.0f,0.0f,basePinchScale+pinchScale);
	
    glRotatef(rotY,1.0f, 0.0f,0.0f);
	glRotatef(rotX,0.0f, 1.0f,0.0f);
    
  
    glClearColor(0.5, 0.5, 0.5, 1.0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
   
    
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	
	glBindTexture(GL_TEXTURE_2D, currentTexture);
	
    glVertexPointer(3, GL_FLOAT, 0, sphereTriangleStripVertices);
    glNormalPointer(GL_FLOAT, 0, sphereTriangleStripNormals);
	
	glTexCoordPointer(2, GL_FLOAT, 0, texCoords);
	
    glDrawArrays(GL_TRIANGLE_STRIP, 0, sphereTriangleStripVertexCount);
    
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_NORMAL_ARRAY);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	
    static NSTimeInterval lastDrawTime;
    if (lastDrawTime)
    {
#if AUTO_SPIN
		NSTimeInterval timeSinceLastDraw = [NSDate timeIntervalSinceReferenceDate] - lastDrawTime;
		rotX+= 25 * timeSinceLastDraw;
#else
		rotX+=rotVelX;
		rotY+=rotVelY;
		
		/*
		 
		 A little friction here; no nice animation curve, just linear and ugly
		 
		 */
		
		if (rotVelX > 0.4)
			rotVelX-=0.4;
		else if (rotVelX < -0.4)
			rotVelX+=0.4;
		
		
		if (rotVelY > 0.1)
			rotVelY-=0.1;
		else if (rotVelY < -0.1)
			rotVelY+=0.1;
		else
			rotVelY = 0;
#endif
		
    }
    lastDrawTime = [NSDate timeIntervalSinceReferenceDate];
}



-(void)loadTexture:(NSString *)resource forID:(GLuint *)tex
{
	glEnable(GL_TEXTURE_2D);
    glEnable(GL_BLEND);
    glBlendFunc(GL_ONE, GL_SRC_COLOR);
	
	glGenTextures(1, tex);
    glBindTexture(GL_TEXTURE_2D, *tex);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR); 
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR); 
	
	NSString *path = [[NSBundle mainBundle] pathForResource:resource ofType:@"png"];
	NSData *texData = [[NSData alloc] initWithContentsOfFile:path];
    UIImage *image = [[UIImage alloc] initWithData:texData];
    
    if (image == nil)
        NSLog(@"Do real error checking here");
    
 	GLuint width = (int)CGImageGetWidth(image.CGImage);
    GLuint height = (int)CGImageGetHeight(image.CGImage);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    void *imageData = malloc( height * width * 4 );
    CGContextRef context = CGBitmapContextCreate( imageData, width, height, 8, 4 * width, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big );
	
    // Flip the Y-axis
    CGContextTranslateCTM (context, 0, height);
    CGContextScaleCTM (context, 1.0, -1.0);
    
   
    CGColorSpaceRelease( colorSpace );
    CGContextClearRect( context, CGRectMake( 0, 0, width, height ) );
    CGContextDrawImage( context, CGRectMake( 0, 0, width, height ), image.CGImage );
	 
    
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, imageData);
	
    CGContextRelease(context);
    
    free(imageData);
	
}



-(void)next{
    if (currentTexture == earthTexture)
    {
        currentTexture = marsTexture;
        NSLog(@"mars");
        [txtlabel setText:@"Mars"];
    }
    else if (currentTexture == marsTexture)
    {
        currentTexture = jupiterTexture;
        NSLog(@"jupiter");
        [txtlabel setText:@"Jupiter"];
    }
    else if (currentTexture == jupiterTexture)
    {
        currentTexture = mercureTexture;
        NSLog(@"mercure");
        [txtlabel setText:@"Mercure"];
    }
    else if (currentTexture == mercureTexture)
    {
        currentTexture = neptuneTexture;
        NSLog(@"neptune");
        [txtlabel setText:@"Neptune"];
    }
    else if (currentTexture == neptuneTexture)
    {
        currentTexture = uranusTexture;
        NSLog(@"uranus");
        [txtlabel setText:@"Uranus"];
    }
    else if (currentTexture == uranusTexture)
    {
        currentTexture = venusTexture;
        NSLog(@"venus");
        [txtlabel setText:@"Venus"];
    }
    else if (currentTexture == venusTexture)
    {
        currentTexture = saturneTexture;
        NSLog(@"saturne");
        [txtlabel setText:@"Saturne"];
    }
    else if (currentTexture == saturneTexture)
    {
        currentTexture = plutonTexture;
        NSLog(@"pluton");
        [txtlabel setText:@"Pluton"];
    }
    else if (currentTexture == plutonTexture)
    {
        currentTexture = soleilTexture;
        NSLog(@"sun");
        [txtlabel setText:@"Sun"];
    }
    else if (currentTexture == soleilTexture)
    {
        currentTexture = moonTexture;
        NSLog(@"moon");
        [txtlabel setText:@"Moon"];
    }
    else
    {
        currentTexture = earthTexture;
        NSLog(@"earth");
        [txtlabel setText:@"Earth"];
    }
    
}

-(void)back{
    if (currentTexture == earthTexture)
    {
        currentTexture = moonTexture;
        NSLog(@"moon");
        [txtlabel setText:@"Moon"];
    }
    else if (currentTexture == moonTexture)
    {
        currentTexture = soleilTexture;
        NSLog(@"sun");
        [txtlabel setText:@"Sun"];
    }
    else if (currentTexture == soleilTexture)
    {
        currentTexture = plutonTexture;
        NSLog(@"pluton");
        [txtlabel setText:@"Pluton"];
    }
    else if (currentTexture == plutonTexture)
    {
        currentTexture = saturneTexture;
        NSLog(@"saturne");
        [txtlabel setText:@"Saturne"];
    }
    else if (currentTexture == saturneTexture)
    {
        currentTexture = venusTexture;
        NSLog(@"venus");
        [txtlabel setText:@"Venus"];
    }
    else if (currentTexture == venusTexture)
    {
        currentTexture = uranusTexture;
        NSLog(@"uranus");
        [txtlabel setText:@"Uranus"];
    }
    else if (currentTexture == uranusTexture)
    {
        currentTexture = neptuneTexture;
        NSLog(@"neptune");
        [txtlabel setText:@"Neptune"];
    }
    else if (currentTexture == neptuneTexture)
    {
        currentTexture = mercureTexture;
        NSLog(@"mercure");
        [txtlabel setText:@"Mercure"];
    }
    else if (currentTexture == mercureTexture)
    {
        currentTexture = jupiterTexture;
        NSLog(@"jupiter");
        [txtlabel setText:@"Jupiter"];
    }
    else if (currentTexture == jupiterTexture)
    {
        currentTexture = marsTexture;
        NSLog(@"mars");
        [txtlabel setText:@"Mars"];
    }
    else
    {
        currentTexture = earthTexture;
        NSLog(@"earth");
        [txtlabel setText:@"Earth"];
    }
    
}

-(void)tapped
{
	if (currentTexture == earthTexture)
	{
		currentTexture = marsTexture;
        NSLog(@"mars");
        [txtlabel setText:@"Mars"];
    }
    else if (currentTexture == marsTexture)
    {
        currentTexture = jupiterTexture;
        NSLog(@"jupiter");
        [txtlabel setText:@"Jupiter"];
    }
    else if (currentTexture == jupiterTexture)
    {
        currentTexture = mercureTexture;
        NSLog(@"mercure");
        [txtlabel setText:@"Mercure"];
    }
    else if (currentTexture == mercureTexture)
    {
        currentTexture = neptuneTexture;
        NSLog(@"neptune");
        [txtlabel setText:@"Neptune"];
    }
    else if (currentTexture == neptuneTexture)
    {
        currentTexture = uranusTexture;
        NSLog(@"uranus");
        [txtlabel setText:@"Uranus"];
    }
    else if (currentTexture == uranusTexture)
    {
        currentTexture = venusTexture;
        NSLog(@"venus");
        [txtlabel setText:@"Venus"];
    }
    else if (currentTexture == venusTexture)
    {
        currentTexture = saturneTexture;
        NSLog(@"saturne");
        [txtlabel setText:@"Saturne"];
    }
    else if (currentTexture == saturneTexture)
    {
        currentTexture = plutonTexture;
        NSLog(@"pluton");
        [txtlabel setText:@"Pluton"];
    }
    else if (currentTexture == plutonTexture)
    {
        currentTexture = soleilTexture;
        NSLog(@"sun");
        [txtlabel setText:@"Sun"];
    }
    else if (currentTexture == soleilTexture)
    {
        currentTexture = moonTexture;
        NSLog(@"moon");
        [txtlabel setText:@"Moon"];
    }
	else
	{
		currentTexture = earthTexture;
        NSLog(@"earth");
        [txtlabel setText:@"Earth"];
	}
	
}

-(void)pan:(UIPanGestureRecognizer *)p
{
	
	rotVelX = ([p velocityInView:self.view].x/180);
	
	// two-axis rotation is a little bit more complicated than just this
		rotVelY = ([p velocityInView:self.view].y/180);
	
}

-(void)pinch:(UIPinchGestureRecognizer *)p
{
	
	if (pinchScale + p.velocity/5. < 1.95)
	{
		pinchScale += p.velocity/5.;
	}
}

-(void)setupView:(GLView*)view
{
	
	[self loadTexture:@"terremap" forID:&earthTexture];
	[self loadTexture:@"marsmap" forID:&marsTexture];
    [self loadTexture:@"mercuremap" forID:&mercureTexture];
    [self loadTexture:@"jupitermap" forID:&jupiterTexture];
    [self loadTexture:@"saturnmap" forID:&saturneTexture];
    [self loadTexture:@"venusmap" forID:&venusTexture];
    [self loadTexture:@"neptunemap" forID:&neptuneTexture];
    [self loadTexture:@"soleilmap" forID:&soleilTexture];
    [self loadTexture:@"plutonmap" forID:&plutonTexture];
    [self loadTexture:@"uranusmap" forID:&uranusTexture];
    [self loadTexture:@"moonmap" forID:&moonTexture];

	CGSize screenSize = [[UIScreen mainScreen] bounds].size;
	currentTexture = earthTexture;
	
    txtlabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 70.0, 90.0, 80.0)];
    [txtlabel setText:@"Earth"];
    [txtlabel setTextColor:[UIColor redColor]];
    [txtlabel setBackgroundColor:[UIColor clearColor]];
    [txtlabel setFont:[UIFont fontWithName: @"GillSans-Light" size: 24.0f]];
    [view addSubview:txtlabel];
    
    
	//UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
	UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];	
	UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    //[self.view addGestureRecognizer:tap];
	[self.view addGestureRecognizer:pan];
	[self.view addGestureRecognizer:pinch];
	
    
    
    UIImage *nextimg = [UIImage imageNamed:@"next.png"];
    UIButton *btnext = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnext addTarget:self action:@selector(next)
    forControlEvents:UIControlEventTouchUpInside];
    [btnext sizeToFit];
    [btnext setBackgroundImage:nextimg forState:UIControlStateNormal];
    //[btnext setTitle:@"Next" forState:UIControlStateNormal];
    btnext.frame = CGRectMake(250.0, 470.0, 60.0, 60.0);
    if (screenSize.height == 736){
        btnext.frame = CGRectMake(340.0, 650.0, 60.0, 60.0);
    }
    if (screenSize.height == 667){
        btnext.frame = CGRectMake(300.0, 580.0, 60.0, 60.0);
    }
    if (screenSize.height == 480){
        btnext.frame = CGRectMake(250.0, 420.0, 60.0, 60.0);
    }
    if ([[UIDevice currentDevice] userInterfaceIdiom] ==UIUserInterfaceIdiomPad) {
        btnext.frame = CGRectMake(600.0, 850.0, 50.0, 50.0);
    }
    [self.view addSubview:btnext];
    
    
    
    UIImage *backimg = [UIImage imageNamed:@"back.png"];
    UIButton *btnback = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnback addTarget:self action:@selector(back)
    forControlEvents:UIControlEventTouchUpInside];
    [btnback sizeToFit];
    [btnback setBackgroundImage:backimg forState:UIControlStateNormal];
    //[btnback setTitle:@"Back" forState:UIControlStateNormal];
    btnback.frame = CGRectMake(5.0, 470.0, 60.0, 60.0);
    if (screenSize.height == 736){
    btnback.frame = CGRectMake(5.0, 650.0, 60.0, 60.0);
    }
    if (screenSize.height == 667){
        btnback.frame = CGRectMake(5.0, 580.0, 60.0, 60.0);
    }
    if (screenSize.height == 480){
        btnback.frame = CGRectMake(5.0, 420.0, 60.0, 60.0);
    }
    if ([[UIDevice currentDevice] userInterfaceIdiom] ==UIUserInterfaceIdiomPad) {
        btnback.frame = CGRectMake(5.0, 850.0, 50.0, 50.0);
    }
    [self.view addSubview:btnback];
    
    
    
	const GLfloat zNear = 0.01, zFar = 1000.0, fieldOfView = 45.0;
	GLfloat size; 
	glEnable(GL_DEPTH_TEST);
	glMatrixMode(GL_PROJECTION); 
	size = zNear * tanf(DEGREES_TO_RADIANS(fieldOfView) / 2.0); 
	CGRect rect = view.bounds;
	
	rect.size.width *= [UIScreen mainScreen].scale;
	rect.size.height *= [UIScreen mainScreen].scale;
	
	glFrustumf(-size, size, -size / (rect.size.width / rect.size.height), size /
			   (rect.size.width / rect.size.height), zNear, zFar);
	glViewport(0, 0, rect.size.width, rect.size.height);  
	glMatrixMode(GL_MODELVIEW);
    glShadeModel(GL_SMOOTH);
    // Enable lighting
    glEnable(GL_LIGHTING);
    
    // Turn the first light on
    glEnable(GL_LIGHT0);
	
	
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    
    // Define the ambient component of the first light
    static const Color3D light0Ambient[] = {{0.2, 0.2, 0.2, 1.0}};
	glLightfv(GL_LIGHT0, GL_AMBIENT, (const GLfloat *)light0Ambient);
    
    // Define the diffuse component of the first light
    static const Color3D light0Diffuse[] = {{0.8, 0.8, 0.8, 1.0}};
	glLightfv(GL_LIGHT0, GL_DIFFUSE, (const GLfloat *)light0Diffuse);
    
    // Define the specular component and shininess of the first light
    static const Color3D light0Specular[] = {{0.6, 0.6, 0.6, 1.0}};
    glLightfv(GL_LIGHT0, GL_SPECULAR, (const GLfloat *)light0Specular);
    
    // Define the position of the first light
    // const GLfloat light0Position[] = {10.0, 10.0, 10.0}; 
    static const Vertex3D light0Position[] = {{10.0, 10.0, 30.0}};
	glLightfv(GL_LIGHT0, GL_POSITION, (const GLfloat *)light0Position); 
	
    // Calculate light vector so it points at the object
    static const Vertex3D objectPoint[] = {{0.0, 0.0, -3.0}};
    const Vertex3D lightVector = Vector3DMakeWithStartAndEndPoints(light0Position[0], objectPoint[0]);
    glLightfv(GL_LIGHT0, GL_SPOT_DIRECTION, (GLfloat *)&lightVector);
    
    // Define a cutoff angle. This defines a 90° field of vision, since the cutoff
    // is number of degrees to each side of an imaginary line drawn from the light's
    // position along the vector supplied in GL_SPOT_DIRECTION above
    glLightf(GL_LIGHT0, GL_SPOT_CUTOFF, 25.0);
    
	glLoadIdentity(); 
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    
    getSolidSphere(&sphereTriangleStripVertices, &sphereTriangleStripNormals, &sphereTriangleStripVertexCount, 1.0, LAT, LONG);
}
- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning]; 
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
		
	}
	else
	{
		return NO;
		
	}
}

@end
