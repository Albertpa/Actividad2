#import <UIKit/UIKit.h>

@interface GTViewController : UIViewController <UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgFondo;
@property (weak, nonatomic) IBOutlet UISlider *sldVelocidad;
@property (weak, nonatomic) IBOutlet UILabel *lblVelocidad;

@property (weak, nonatomic) IBOutlet UILabel *lblNotificacion;

- (IBAction)selectImagen:(id)sender;

@end
