//
//  ViewController.h
//  Flag Game
//
//  Created by Arjun Hanswal on 10/13/16.
//  Copyright © 2016 Com.BLE  TestApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *flagimage;
@property (weak, nonatomic) IBOutlet UIButton *option1;
@property (weak, nonatomic) IBOutlet UIButton *otion2;
@property (weak, nonatomic) IBOutlet UIButton *option3;
@property (weak, nonatomic) IBOutlet UIButton *option4;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *QuesCount;

@end

