//
//  MDMInputOutput.m
//  MedMon
//
//  Created by Saurabh Rathod on 8/1/14.
//  Copyright (c) 2014 Health Information Management. All rights reserved.
//

#import "MDMInputOutput.h"
#import <Foundation/Foundation.h>

@implementation MDMInputOutput

//This is a String variable declared as a string.
//It has the current file-path, followed by the custom file-path.
NSString *fileDir = @"mdm";
NSString *filePath;
//NSFileManager *f;


- (void) write:(NSString *)file content:(NSString *)data
{
    NSArray *documentDirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *toDocumentDir = [documentDirPath objectAtIndex:0];
    NSLog(@"Directory path index change at: %@", toDocumentDir);
    NSString *pathToFile = [toDocumentDir stringByAppendingPathComponent:file];
    NSLog(@"Path to file appended with file name at: %@", pathToFile);
    [data writeToFile:pathToFile atomically:YES encoding:NSUTF8StringEncoding error: NULL];
    
}


/**
- (void) write:(NSString *)file content:(NSString *)data
{
    NSString *print;
//	va_start(ap,format);
	print=[[NSString alloc] initWithFormat:normal arguments:nil];
	//va_end(ap);
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
														 NSUserDomainMask, YES);
	NSString* docDir = [paths objectAtIndex:0];
    NSString* file2 = [docDir stringByAppendingString:file];
    
	
	// create directory
	//[[NSFileManager defaultManager] createDirectoryAtPath:paths attributes:nil];
	
	
	FILE *f = fopen([[NSString stringWithFormat:@"%@/%@", paths, file2] cStringUsingEncoding:1], "+a");
    
	
	// write to file
	fprintf(f, "%s: %s\r\n", [[[NSDate date] description] UTF8String], [data UTF8String]);
	fclose(f);
	
	// write to console
	NSLog(print);
	
	//[print release];

}
 
**/

/**
- (void) write:(NSString *)file content:(char *)data
{
    
    f = [NSFileManager defaultManager];
    filePath = [f changeCurrentDirectoryPath: [NSDocumentDirectory];
    
    if ([f createDirectoryAtPath:fileDir withIntermediateDirectories: YES attributes: nil error: NULL])
    {
        NSLog(@"Error creating directory %@", filePath);
    }
    NSLog(@"Directory should be created: %@", fileDir);
    
    if ([f changeCurrentDirectoryPath:file] == NO)
    {
        NSLog(@"Error changing directory to %@", fileDir);
    }
    
    filePath = [f currentDirectoryPath];
    NSLog(@"Current Directory: %@", filePath);
}
*/

/**
 
 
//This here is a method called write, with parameters of NSString file, and char data.
//In Objective, a method does not accept parameters followed by a comma, so you guys
//have to write the other parameter same as writing a method name. LOL, dunno if you'd
//understand this.
- (void) write: (NSString *) file  content:(char *)data
{
    //NSFileManager *filemgr;
    //filemgr = [NSFileManager defaultManager];
    
    
    //if ([filemgr fileExistsAtPath: timeFile ] == YES)
    //    NSLog (@"File exists");
    //else
    //    NSLog (@"File not found");
    //[[NSFileManager defaultManager] createFileAtPath:[NSString stringWithFormat:@"%@/%@", timeFile, file] contents:nil attributes:nil];
    
    NSLog([[NSFileManager defaultManager] currentDirectoryPath]);
    if ([[NSFileManager defaultManager] createDirectoryAtPath:timeFile withIntermediateDirectories:YES attributes:nil error: NULL] == NO) {
        NSLog(@"Error creating directory %@", timeFile);
    }
    
    //Ignore the above. This here following, declares a default file manager,
    //and creates a file at the current application directory. To make it easier,
    //I've put the file path here, and concatenated it with the file name in the parameter.
    [[NSFileManager defaultManager] createFileAtPath: [timeFile stringByAppendingString: file] contents: nil attributes: nil];
    
    NSLog(@" File sohuld be created !");
    
    NSFileHandle *fileName;
    NSMutableData *content;
    
    //This here declaration takes the "data" parameter of the method,
    //So we can write the contents of that parameter into the file.
    const char *bytestring = data;
    
    //The following must be written, because everytime we put data into a file,
    //we write it in "byte" format, because obvouisly computer cannot take a text format.
    content = [NSMutableData dataWithBytes:bytestring length:strlen(bytestring)];
    
    
    //fileName = [NSFileHandle fileHandleForUpdatingAtPath: [NSString stringWithFormat:@"%@/%@", timeFile, file]];
    
    //This here prepares the data in the file so it can finally write or even read.
    fileName = [NSFileHandle fileHandleForUpdatingAtPath: [timeFile stringByAppendingString: file]];
    
    //Checks if the file can be opened or not.
    //NOTE: it does NOT check if the file exists.
    if (fileName == nil)
        NSLog(@"Failed to open file");
    
    //Load the file and take upto ten bytes of it.
    //$[fileName seekToFileOffset: 10];
    
    //Write the data preceding the 10 byte load.
    //Hope this works...
    //$[fileName writeData: content];
    
    //Finally, we want to close the file to avoid resource leaks.
    [fileName closeFile];
    
}

 */


- (NSString *) read: (NSString *) file
{
    
    
    NSFileHandle *fileName;
    NSData *databuffer;
//=====================================================================================================//
    //NSLog(@"=================================================================================");
    NSArray *documentDirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *toDocumentDir = [documentDirPath objectAtIndex:0];
    //NSLog(@"Directory path index change at: %@", toDocumentDir);
    NSString *pathToFile = [toDocumentDir stringByAppendingPathComponent:file];
    //NSLog(@"Path to file appended with file name at: %@", pathToFile);
//=====================================================================================================//
    
    fileName = [NSFileHandle fileHandleForReadingAtPath: pathToFile];
    
    if (file == nil)
        NSLog(@"Failed to open file");
    
    [fileName seekToFileOffset: 0];
    
    databuffer = [fileName readDataToEndOfFile];
    NSString *result = [[NSString alloc] initWithData:databuffer encoding:NSASCIIStringEncoding];
    return result;
    [fileName closeFile];
}
 
@end
