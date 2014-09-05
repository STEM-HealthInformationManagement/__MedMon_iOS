//
//  MDMViewController.h
//  MedMon
//
//  Created by Saurabh Rathod on 7/29/14.
//  Copyright (c) 2014 Health Information Management. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDMViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>



@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UILabel *timePerDay;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic)          NSArray *dayArray;
@property (strong, nonatomic) IBOutlet UITextField *medName;
@property (strong, nonatomic) IBOutlet UITextField *medDsc;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
//- (IBAction) saveAction: (UIButton *)sender;

@property (strong, readwrite) NSString *frequent;


@end
