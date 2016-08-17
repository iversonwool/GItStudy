//
//  ViewController.m
//  ProgressBar
//
//  Created by 李浩 on 16/8/17.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)valueChanged:(id)sender {
    
    UISlider *slide = sender;
    self.progressView.value = slide.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
