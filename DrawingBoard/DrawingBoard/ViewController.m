//
//  ViewController.m
//  DrawingBoard
//
//  Created by 李浩 on 16/8/20.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"
#import "DrawingBoardView.h"
#import "PaddingView.h"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet DrawingBoardView *boardView;

@end

@implementation ViewController
- (IBAction)selectPicture:(id)sender {
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imgPicker.delegate = self;
    [self presentViewController:imgPicker animated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    [self.boardView save];
}

- (IBAction)erase:(id)sender {
    
    self.boardView.color = [UIColor whiteColor];
}

- (IBAction)undo:(id)sender {
    [self.boardView undo];
}

- (IBAction)clear:(id)sender {
    [self.boardView clear];
}

- (IBAction)btnClicked:(id)sender {
    UIButton *btn = sender;
    self.boardView.color = btn.backgroundColor;
}


- (IBAction)slideValueChanged:(id)sender {
    UISlider *slider = sender;
    self.boardView.lineW = slider.value;
    
}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
//    __weak typeof(self) weakSelf = self;
    UIImage *image = info[UIImagePickerControllerOriginalImage];
//    self.boardView.image = image;
    // 添加隔层View 操作隔层 截屏隔层 
    PaddingView *paddingView = [[PaddingView alloc] initWithFrame:self.boardView.frame];
    paddingView.img = image;
    paddingView.passImgBlock = ^(UIImage *image) {
//        weakSelf.boardView.image = image;
        self.boardView.image = image;
    };
    [self.view addSubview:paddingView];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
