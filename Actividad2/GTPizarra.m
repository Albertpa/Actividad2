
#import "GTPizarra.h"
#import "GTLinea.h"

@implementation GTPizarra
@synthesize lineas;   

-(IBAction)borrar:(id)sender
{
    //Reiniciar la vista borrando todas las líneas.
//yo
    _lineas = [NSMutableArray new];
    [self setNeedsDisplay];
//fyo

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(NSMutableArray *)lineas{
    if (_lineas == nil) {
        _lineas = [NSMutableArray new];
    }
    return _lineas;
}

- (void)drawRect:(CGRect)rect
{
    
    //Pintar todas las líneas de NSMutableArray lineas de color rojo y con un grosor de línea de 3.
    
    
//yo
    //obtenemos contexto
    CGContextRef contexto = UIGraphicsGetCurrentContext();
   
    UIColor * rojo = [UIColor redColor];
    
    CGContextSetStrokeColorWithColor(contexto, rojo.CGColor);
    CGContextSetLineWidth(contexto, 3);
    
    
    //dibujamos la linea almacenada en lineas
    //Aqui haremos un bucle for del array donde almacenamos las lineas
/*
    Pruebas
    int i;
    GTLinea *l = nil;
    GTLinea *l2 = nil;

    for(i = 0; i < [self.lineas count]; i++){
        if (l == nil){
           l =[self.lineas objectAtIndex:i];
        }else{
            l2 = l;
            l =[self.lineas objectAtIndex:i];
        }
       
        if(l!=nil){
            CGContextMoveToPoint(contexto, l2.puntos.origin.x, l2.puntos.origin.y); //origen de linea
            CGContextAddLineToPoint(contexto, l.puntos.origin.x, l.puntos.origin.y); //linea hasta
            
        }
       
    }
    CGContextStrokePath(contexto);

*/

    for(GTLinea *l in self.lineas){
         CGContextMoveToPoint(contexto, l.puntos.origin.x, l.puntos.origin.y); //origen de linea
         CGContextAddLineToPoint(contexto, l.puntos.size.width, l.puntos.size.height);
    }
    CGContextStrokePath(contexto);
//fyo
     
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //Actualizar los atributos inicio y fin.
    
//yo
    //primer punto
    UITouch * touch = [touches anyObject];
    inicio = [touch locationInView:self];
    fin = [touch locationInView:self];
    GTLinea * linea = [[GTLinea alloc] initWithRect:CGRectMake(inicio.x, inicio.y, fin.x, fin.y)];
    [self.lineas addObject: linea];
        
    //que se redibuje la vista, vuelve a llamar a drawRect
    [self setNeedsDisplay];
//fyo
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //Añadir las coordenadas del movimiento al NSMutableArray lineas haciendo uso de la clase GTLinea.
    //Actualizar los atributos inicio y fin.
    //Recargar la vista.
    
    UITouch * touch = [touches anyObject];
    fin = [touch locationInView:self];
    GTLinea * linea = [[GTLinea alloc] initWithRect:CGRectMake(inicio.x, inicio.y, fin.x, fin.y)];
    [self.lineas addObject: linea];
    inicio.x = fin.x;
    inicio.y = fin.y;
    [self setNeedsDisplay];
}


@end
