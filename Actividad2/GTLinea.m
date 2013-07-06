#import "GTLinea.h"

@implementation GTLinea
@synthesize puntos = _puntos;

- (id)initWithRect:(CGRect)puntos
{
    self = [super init];
    if (self) {
        self.puntos = puntos;
    }
    return self;
}

@end
