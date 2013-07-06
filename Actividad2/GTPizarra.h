#import <UIKit/UIKit.h>

@interface GTPizarra : UIView{
    CGPoint inicio;
    CGPoint fin;
    NSMutableArray * _lineas;
}

@property (readonly,getter = lineas ) NSMutableArray * lineas;


@end
