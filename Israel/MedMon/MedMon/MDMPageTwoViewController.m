//
//  MDMPageTwoViewController.m
//  MedMon
//
//  Created by Aakash Patel on 8/4/14.
//  Copyright (c) 2014 Health Information Management. All rights reserved.
//

#import "MDMPageTwoViewController.h"
#import "MDMInputOutput.h"
#import "MDMViewController.h"
#import "MDMAppDelegate.h"

@interface MDMPageTwoViewController ()

@end

@implementation MDMPageTwoViewController
@synthesize amt;
@synthesize leftOver;
@synthesize oldTime;
@synthesize newTime;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
 
    [self updateTime4];
    [self updateTime];
    
    /* NSThread* ut_thread1 = [[NSThread alloc] initWithTarget:self
                                                 selector:@selector(updateTime)
                                                   object:nil];
    [ut_thread1 start];  // Actually create the thread
    
    NSThread* ut_thread2 = [[NSThread alloc] initWithTarget:self
                                                 selector:@selector(updateTime4)
                                                   object:nil];
    [ut_thread2 start];  // Actually create the thread
*/
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 568)];
    
    //Initialize the InputOutput class as an Object.
    MDMInputOutput *reader = [[MDMInputOutput alloc] init];
    fileOutputLabel.text = [reader read:@"mdm.vpr"];
}

//Updates the timer
- (void)updateTime
{
    //MDMViewController *something = [[MDMViewController alloc] init];
        MDMInputOutput *reader = [[MDMInputOutput alloc] init];
    [updateTimer invalidate];
    updateTimer = nil;
    
    currentTime = [NSDate date];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setTimeStyle:NSDateFormatterMediumStyle];
    lblTime.text= [timeFormatter stringFromDate:currentTime];
    
    updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTime)
                                                 userInfo:nil repeats:YES];
    
    NSInteger currentTime = [fileOutputLabel.text intValue];
    
   
    
    
    if (reminder) {
        goto alpha;
    }
    if([[reader read:@"mdm.vpr"] isEqualToString:@"Once A Day"]  && reminder == false){
        amt = 8;
     ((MDMAppDelegate *)([UIApplication sharedApplication].delegate)).TimeRemaining = 8;
    reminder = true;
    }
     if([[reader read:@"mdm.vpr"] isEqualToString:@"Twice A Day"]&& reminder == false ){
         amt = 16;
          ((MDMAppDelegate *)([UIApplication sharedApplication].delegate)).TimeRemaining = 2;
         reminder = true;
            }
    if([[reader read:@"mdm.vpr"] isEqualToString:@"Three Times A Day"]&& reminder == false ){
        amt = 24;
         ((MDMAppDelegate *)([UIApplication sharedApplication].delegate)).TimeRemaining = 3;
        reminder = true;
    }
    if([[reader read:@"mdm.vpr"] isEqualToString:@"Four Times A Day"]&& reminder == false){
        amt = 32;
         ((MDMAppDelegate *)([UIApplication sharedApplication].delegate)).TimeRemaining = 4;
        reminder = true;
    }
    if([[reader read:@"mdm.vpr"] isEqualToString:@"Five Times A Day"]&& reminder == false){
        amt = 40;
         ((MDMAppDelegate *)([UIApplication sharedApplication].delegate)).TimeRemaining = 5;
        reminder = true;
    }
    if([[reader read:@"mdm.vpr"] isEqualToString:@"Six Times A Day"]&& reminder == false){
        amt =  48;
        ((MDMAppDelegate *)([UIApplication sharedApplication].delegate)).TimeRemaining = 6;
        reminder = true;
    }
    
   
    
alpha:
    
            if (oldTime == amt) {
        UIAlertView *medAlert = [[UIAlertView alloc] initWithTitle:@"Time's up!! "
                                                           message:[@"Please take " stringByAppendingString:[reader read:@"med.vpr"]]
                                                          delegate:self
                                                 cancelButtonTitle:@"Took Medicine!!"
                                                 otherButtonTitles:@"Remind Me Later" ,@"Finished Prescription", nil];
        [medAlert show];
        [timer invalidate];
              
            oldTime= nil;
                newTime = nil;
                       

    }
    
            
    
        
        
    
   
   


    fileOutputLabel.text = [NSString stringWithFormat:@"%ld",(long)oldTime]; // comment out this line so the debugging timer (not the digital clock) doesnt show up.
}

-(void)alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex ==0) {
        NSLog(@" you pressed button 0");
        //button 0 is the took medicine button
        reminder = false;
        // when button 0 is pressed set reminder false because this button is not a reminder me later.
         [self viewDidLoad];
    }
    if (buttonIndex ==1) {
        NSLog(@"you pressed button 1");
        //button 1 is the remind me later button
        reminder = true;
        
        //when button 1 is pressed ..it will remind you in 8 seconds
        amt = 80;
        ((MDMAppDelegate *)([UIApplication sharedApplication].delegate)).TimeRemaining = 10;
         [self viewDidLoad];
    }
    
}




- (NSString *)updateTime2
{
    NSString *result = @"";
    [updateTimer invalidate];
    updateTimer = nil;
    
    currentTime = [NSDate date];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setTimeStyle:NSDateFormatterMediumStyle];
    result = [timeFormatter stringFromDate:currentTime];
    
    updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTime)userInfo:nil repeats:YES];
    
    return result;
}

- (NSString *)updateTime3
{
    NSString *result2 = @"";
    [updateTimer invalidate];
    updateTimer = nil;
    
    currentTime = [NSDate date];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setTimeStyle:NSDateFormatterShortStyle];
    result2 = [timeFormatter stringFromDate:currentTime];
   

    updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTime)userInfo:nil repeats:YES];
    
    return result2;
}



- (NSString *)updateTime4
{
    NSString *result = @"";
    [updateTimer invalidate];
    updateTimer = nil;
   
    currentTime = [NSDate date];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    //newTime= [NSTimer scheduledTimerWithTimeInterval: 1 target:self selector:@selector(TimeCounter)userInfo:nil repeats:YES];
    result = [timeFormatter stringFromDate:currentTime];
          updateTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(updateTime)userInfo:nil repeats:YES];
    timer= [NSTimer scheduledTimerWithTimeInterval: 1 target:self selector:@selector(TimeCounter)userInfo:nil repeats:YES];
    
    return result;
}
-(void)TimeCounter{
    oldTime = oldTime+1;
 
    if (oldTime !=0) {
        newTime = oldTime;
        leftOver= amt - newTime;
        
        NSLog(@"%ld", (long)leftOver);
         ((MDMAppDelegate *)([UIApplication sharedApplication].delegate)).TimeRemaining = leftOver;
        if ( ((MDMAppDelegate *)([UIApplication sharedApplication].delegate)).backgroundActive) {
           
            
            newTime = nil;
            oldTime = nil;
            
        }
    }
   
    
    
}
    
-(void)test:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
