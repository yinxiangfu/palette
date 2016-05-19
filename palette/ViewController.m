//
//  ViewController.m
//  palette
//
//  Created by biznest on 15/5/27.
//  Copyright (c) 2015年 biznest. All rights reserved.
//

#import "ViewController.h"
#import "XFDrawView.h"

@interface ViewController ()
{
    NSArray *colors;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    colors = @[[UIColor redColor],
               [UIColor orangeColor],
               [UIColor yellowColor],
               [UIColor greenColor],
               [UIColor cyanColor],
               [UIColor blueColor],
               [UIColor purpleColor]];
}

- (IBAction)changeColor:(UISegmentedControl *)sender {
    XFDrawView *v = (XFDrawView *)self.view;
    v.color = colors[sender.selectedSegmentIndex];
}

- (IBAction)chageShape:(UISegmentedControl *)sender {
    XFDrawView *v = (XFDrawView *)self.view;
    v.shape = sender.selectedSegmentIndex;
}


@end
