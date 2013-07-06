#import "GTViewController.h"

@interface GTViewController ()

@end

@implementation GTViewController

@synthesize imgFondo;
@synthesize sldVelocidad;
@synthesize lblVelocidad;
@synthesize lblNotificacion;

- (IBAction)actualizarEtiqueta:(id)sender {
    self.lblVelocidad.text = [NSString stringWithFormat:@"%1.1f s", self.sldVelocidad.value];
}

- (IBAction)selectImagen:(id)sender {

    //Mostrar de manera modal la vista del controlador para seleccionar una imagen de la galería de imágenes del dispositivo.
//yo
    UIImagePickerController * picker = [UIImagePickerController new];
    picker.delegate = self;
    
    picker.title = @"Seleccionar una foto para el fondo";
    
    [self presentModalViewController:picker animated:YES];
//fyo
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    
    //Deshacer la vista modal
    //Asignar la propiedad alpha de imgFondo a 0.
    //Asignar la nueva imagen a imgFondo.
//yo
    self.imgFondo.image = image;
    [self dismissModalViewControllerAnimated:YES];
//fyo
    
    //Animar el cambio a 0.7 de la propiedad alpha de imgFondo.
    //Asignar la duracion de la animación mediante la propiedad value de sldVelocidad.
    //Establecer una curva Linear.

}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    //Asignar las siguiente propiedades de lblNotificacion:
    //    centro.y = 53
    //    alpha = 1
    
//yo
    [self.lblNotificacion setAlpha:1];
    NSLog(@"valor->%@", [change valueForKey:@"new"]);
    
   
//fyo
    
    
    //Animar el cambio de las siguiente propiedades de lblNotificacion:
    //    centro.y = 20
    //    alpha = 0
     
    //con una duracion de 1 segundos, un retardo de 2 segundo y un curva EaseIn.
    
    //NOTA: El retardo de una animación se asgina mediante el método +setAnimationDelay:

//yo
    //[self.lblNotificacion setAlpha:0];
    NSLog(@"valor->%@", [change valueForKey:@"new"]);
    
    
//fyo
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Establecer la propiedad alpha de lblNotificacion a 0;
//yo
    [self.lblNotificacion setAlpha:0];
//fyo
    
    //comenzar a observar los cambios en la propiedad value de sldVelocidad haciendo uso de KVO
//yo
    [self.sldVelocidad addObserver:self
                        forKeyPath:@"value"
                           options:NSKeyValueObservingOptionNew
                           context:nil];
    
//fyo
    
    
}

- (void)viewDidUnload
{
    [self setLblVelocidad:nil];
    [self setImgFondo:nil];
    [self setSldVelocidad:nil];
    [self setLblNotificacion:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
