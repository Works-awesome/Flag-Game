//
//  CurrencyViewController.h
//  Flag Game
//
//  Created by Arjun Hanswal on 10/13/16.
//  Copyright © 2016 Com.BLE  TestApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrencyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *CName;
@property (weak, nonatomic) IBOutlet UILabel *Capital;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *currency;
@property (weak, nonatomic) IBOutlet UILabel *lang;
@property (weak, nonatomic) IBOutlet UILabel *population;
@property (weak, nonatomic) IBOutlet UILabel *Region;
@property (weak, nonatomic) IBOutlet UILabel *border;
@end
