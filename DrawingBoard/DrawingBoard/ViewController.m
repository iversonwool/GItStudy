//
//  ViewController.m
//  DrawingBoard
//
//  Created by 李浩 on 16/8/20.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"
#import "DrawingBoardView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawingBoardView *boardView;

@end

@implementation ViewController
- (IBAction)btnClicked:(id)sender {
    UIButton *btn = sender;
    self.boardView.color = btn.backgroundColor;
}


- (IBAction)slideValueChanged:(id)sender {
    UISlider *slider = sender;
    self.boardView.lineW = slider.value;
    
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
