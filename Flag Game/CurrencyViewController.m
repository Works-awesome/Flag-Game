//
//  CurrencyViewController.m
//  Flag Game
//
//  Created by Arjun Hanswal on 10/13/16.
//  Copyright © 2016 Com.BLE  TestApp. All rights reserved.
//

#import "CurrencyViewController.h"

@interface CurrencyViewController ()

@end
NSArray *currency;
NSArray *country;
NSInteger count;
@implementation CurrencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     currency=[[NSArray alloc]init];
    count=0;
    [self GetData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)GetData{

    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@"https://restcountries.eu/rest/v1/all"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSString * params ;
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           NSLog(@"Response:%@ %@\n", response, error);
                                                           if(error == nil)
                                                           {
                                                              
                                                               
                                                               
                                                               
                                                               
                                                            currency = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                               [self SetData];
                                                      
                                                           }
                                                           
                                                       }];
    [dataTask resume];
  
  
}

-(void)SetData{
    NSLog(@"%ld",(long)count);
    self.image.image=[UIImage imageNamed:[[currency objectAtIndex:count] valueForKey:@"name"]];
    self.CName.text=[[currency objectAtIndex:count] valueForKey:@"name"];
   

     self.population.text=  [NSString stringWithFormat:@"%ld",[[[currency objectAtIndex:count]valueForKey:@"population"] integerValue]];
   
   self.Region.text=[[currency objectAtIndex:count] valueForKey:@"region"];
   self.Capital.text=[[currency objectAtIndex:count] valueForKey:@"capital"];
   NSArray *array= [[currency objectAtIndex:count]valueForKey:@"currencies"];
    if(array.count>0)
    self.currency.text=array[0];
    array=[[currency objectAtIndex:count] valueForKey:@"languages"];
    if(array.count>0)
    self.lang.text=array[0];
}
- (IBAction)Next:(id)sender {
    
    count++;
    [self SetData];
}
- (IBAction)Back:(id)sender {
    if(count>0){
        count--;
        [self SetData];
    
    }
}

@end
