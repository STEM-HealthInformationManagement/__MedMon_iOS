//
//  MDMInputOutput.h
//  MedMon
//
//  Created by Saurabh Rathod on 8/1/14.
//  Copyright (c) 2014 Health Information Management. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDMInputOutput : NSObject

- (void) write: (NSString *) file content: (NSString *) data;
- (NSString *) read: (NSString *) file;

@end
