//
//  MDMAppDelegate.h
//  MedMon
//
//  Created by Saurabh Rathod on 7/21/14.
//  Copyright (c) 2014 Health Information Management. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDMAppDelegate : UIResponder <UIApplicationDelegate>{
    
    BOOL backgroundActive;

}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;

@property (nonatomic, assign) BOOL *backgroundActive;
@property(nonatomic, assign) NSInteger TimeRemaining;
@end



