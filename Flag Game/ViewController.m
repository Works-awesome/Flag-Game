//
//  ViewController.m
//  Flag Game
//
//  Created by Arjun Hanswal on 10/13/16.
//  Copyright © 2016 Com.BLE  TestApp. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioServices.h>
@interface ViewController ()

@end
NSInteger score;
NSArray *countryName;
NSInteger questionCount;
int randNum;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    score=0;
    questionCount=0;
   
    
    
    
    countryName=[ NSArray arrayWithObjects:@"abkhazia",@"afghanistan", @"aland-islands", @"albania", @"algeria", @"american-samoa", @"andorra", @"angola", @"anguilla",@"antigua-and-barbuda",@"argentina",@"armenia",@"aruba",@"australia",@"austria",@"azerbaijan",@"azores-islands",@"bahamas",@"bahrain",@"balearic-islands",@"bangladesh",@"barbados",@"basque-country",@"belarus",@"belgium",@"belize",@"benin",@"bermuda",@"bhutan",@"bolivia",@"bonaire",@"bosnia-and-herzegovina",@"botswana",@"brazil",@"british-columbia",@"british-indian-ocean-territory",@"british-virgin-islands",@"brunei",@"bulgaria",@"burkina-faso",@"burundi",@"cambodia",@"cameroon",@"canada",@"canary-islands",@"cape-verde",@"cayman-islands",@"central-african-republic",@"ceuta",@"chad",@"chile",@"china",@"christmas-island",@"cocos-island",@"colombia",@"comoros",@"cook-islands",@"corsica",@"costa-rica",@"croatia",@"cuba",@"curacao",@"cyprus",@"czech-republic",@"democratic-republic-of-congo",@"denmark",@"djibouti",@"dominica",@"dominican-republic",@"east-timor",@"ecuador",@"egypt",@"el-salvador",@"england",@"equatorial-guinea",@"eritrea",@"estonia",@"ethiopia",@"european-union",@"falkland-islands",@"faroe-islands",@"fiji",@"finland",@"france",@"french-polynesia",@"gabon", @"galapagos-islands", @"gambia", @"georgia", @"germany", @"ghana", @"gibraltar", @"greece", @"greenland", @"grenada", @"guam", @"guatemala", @"guernsey", @"guinea-bissau", @"guinea", @"haiti", @"hawaii", @"honduras", @"hong-kong", @"hungary", @"iceland", @"india", @"indonesia", @"iran", @"iraq", @"ireland", @"isle-of-man", @"israel", @"italy", @"ivory-coast", @"jamaica", @"japan", @"jersey", @"jordan", @"kazakhstan", @"kenya", @"kiribati", @"kosovo", @"kwait", @"kyrgyzstan", @"laos", @"latvia", @"lebanon", @"lesotho", @"liberia", @"libya", @"liechtenstein", @"lithuania", @"luxembourg", @"macao", @"madagascar", @"madeira", @"malasya", @"malawi", @"maldives", @"mali", @"malta", @"marshall-island", @"martinique", @"mauritania", @"mauritius", @"melilla", @"mexico", @"micronesia", @"moldova", @"monaco", @"mongolia", @"montenegro", @"montserrat", @"morocco", @"mozambique", @"myanmar", @"namibia", @"nato", @"nauru", @"nepal", @"netherlands", @"new-zealand", @"nicaragua", @"niger", @"nigeria", @"niue", @"norfolk-island", @"north-korea", @"northern-cyprus", @"northern-marianas-islands", @"norway", @"oman", @"ossetia", @"pakistan", @"palau", @"palestine", @"panama", @"papua-new-guinea", @"paraguay", @"peru", @"philippines", @"pitcairn-islands", @"poland", @"portugal", @"puerto-rico", @"qatar", @"rapa-nui", @"republic-of-macedonia", @"republic-of-the-congo", @"romania", @"russia", @"rwanda", @"saba-island", @"sahrawi-arab-democratic-republic", @"saint-kitts-and-nevis", @"samoa", @"san-marino", @"sao-tome-and-prince", @"sardinia", @"saudi-arabia", @"scotland", @"senegal", @"serbia", @"seychelles", @"sicily", @"sierra-leone", @"singapore", @"sint-eustatius", @"sint-maarten", @"slovakia", @"slovenia", @"solomon-islands", @"somalia", @"somaliland", @"south-africa", @"south-korea", @"south-sudan", @"spain", @"sri-lanka", @"st-barts", @"st-lucia", @"st-vincent-and-the-grenadines", @"sudan", @"suriname", @"swaziland", @"sweden", @"switzerland", @"syria", @"taiwan", @"tajikistan", @"tanzania", @"thailand", @"tibet", @"togo", @"tokelau", @"tonga", @"transnistria", @"trinidad-and-tobago", @"tunisia", @"turkey", @"turkmenistan", @"turks-and-caicos", @"tuvalu-1", @"tuvalu", @"uganda", @"ukraine", @"united-arab-emirates", @"united-kingdom", @"united-nations", @"united-states", @"uruguay", @"uzbekistn", @"vanuatu", @"vatican-city", @"venezuela", @"vietnam", @"virgin-islands", @"wales",  @"yemen",@"zambia",@"zimbabwe",nil];
    NSLog(@"%lu",(unsigned long)countryName.count);
    [self nextQuestion];
}
-(void)viewWillAppear:(BOOL)animated{
    score=0;
    questionCount=0;
    self.score.text=@"0";
    [self nextQuestion];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonpress:(id)sender {
    UIButton *button = (UIButton *)sender;
    if([button.titleLabel.text isEqualToString:countryName[randNum]]){
        
        NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Game-show-correct-answer" ofType:@"mp3"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
        AudioServicesPlaySystemSound (soundID);
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Right"
                                              message:[NSString stringWithFormat:@"%@",countryName[randNum]]
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        button.layer.backgroundColor=[UIColor greenColor].CGColor;
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       [self nextQuestion];
                                   }];
        score=score+10;
        self.score.text=[NSString stringWithFormat:@"%ld",score];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        if(score>0){
            score=score-5;
        }
        NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Wrong-answer-sound-effect" ofType:@"mp3"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
        AudioServicesPlaySystemSound (soundID);
        self.score.text=[NSString stringWithFormat:@"%ld",score];
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Wrong"
                                              message:[NSString stringWithFormat:@"%@",countryName[randNum]]
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                           [self nextQuestion];
                                       }];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
}
-(void)nextQuestion{
    if(questionCount!=20){
        
        self.QuesCount.text=[NSString stringWithFormat:@"%ld/20",(long)questionCount+1];
        randNum = [self getrandom];
        
        self.option4.layer.backgroundColor=[UIColor redColor].CGColor;
        self.option1.layer.backgroundColor=[UIColor redColor].CGColor;
        self.option3.layer.backgroundColor=[UIColor redColor].CGColor;
        self.otion2.layer.backgroundColor=[UIColor redColor].CGColor;
        
        questionCount++;
        int option=(arc4random() % 4) + 1;
        NSLog(@"%d",option);
        
        [self.option1 setTitle:countryName[[self getrandom] ] forState:UIControlStateNormal];
        [self.option3 setTitle:countryName[[self getrandom] ] forState:UIControlStateNormal];
        [self.option4 setTitle:countryName[[self getrandom] ] forState:UIControlStateNormal];
        [self.otion2 setTitle:countryName[[self getrandom]] forState:UIControlStateNormal];
        
        if(option==1){
            
            [self.option1 setTitle:countryName[randNum] forState:UIControlStateNormal];
        }else if(option==2){
            [self.otion2 setTitle:countryName[randNum] forState:UIControlStateNormal];
            
        }else if(option==3){
            [self.option3 setTitle:countryName[randNum] forState:UIControlStateNormal];
            
        }else if(option==4){
            [self.option4 setTitle:countryName[randNum] forState:UIControlStateNormal];
            
        }
        
        self.flagimage.image=[UIImage imageNamed:countryName[randNum]];
    }else{
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Game Over "
                                              message:[NSString  stringWithFormat:@"Your Score %ld",(long)score]
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       [self Restart];
                                   }];
        [alertController addAction:okAction];
        
        
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
}
-(void)Restart{
    
    score=0;
    self.score.text=@"0";
    questionCount=0;
    [self nextQuestion];
    
}
-(int)getrandom{
    
    int value = (arc4random() % 261) + 1;
    return value;
}
@end
