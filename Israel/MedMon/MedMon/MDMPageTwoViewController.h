//
//  MDMPageTwoViewController.h
//  MedMon
//
//  Created by Aakash Patel on 8/4/14.
//  Copyright (c) 2014 Health Information Management. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDMPageTwoViewController : UIViewController
{
    
    IBOutlet UIScrollView *scroller;
    @public IBOutlet UILabel *lblTime;
    
   
    IBOutlet UILabel *fileOutputLabel;
    
    IBOutlet UIButton *newMed;
    NSDate *currentTime;
    NSTimer *updateTimer;
    NSInteger amt;
    NSTimer *timer;
    NSInteger oldTime;
    NSInteger newTime;
    bool reminder;
    NSInteger leftOver;
   
    
    }
@property (nonatomic, assign) NSInteger leftOver;
@property (nonatomic, assign) NSInteger oldTime;
@property (nonatomic, assign) NSInteger newTime;

@property (nonatomic, assign) NSInteger amt;
@property (strong, nonatomic) IBOutlet UIButton *test;
- (IBAction) test: (UIButton *)sender;

-(void)TimeCounter;
    - (NSString *)updateTime2;
- (NSString *)updateTime3;
- (NSString *)updateTime4;

@end
