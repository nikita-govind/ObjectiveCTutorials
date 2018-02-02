//
//  main.m
//  learningObjectiveC
//
//  Created by Nikita Govind on 2/1/18.
//  Copyright © 2018 Nikita Govind. All rights reserved.
//

// Create Project -> Command line tool

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // insert code here...
        NSLog(@"Hello, World!");
        
        // PRINTING FORMATS
        /*
         %@ - id
         %d, %D, %i - long
         %f, %e, %E, %g, %G - double
         %c - unsigned char in ASCII
         %s - char* : null terminated C string in Ascii
         %p - void* : address in hex with leading 0x
         %% - special characters
         
         %C - unsigned char in Unicode
         %S - unichar* : null terminated C string in Unicode characters
         
         %u, %U - unsigned long
         %x, %X - unsigned long in hex
         %o, %O - unsigned long in oct
         
         %qi - long long
         %qu - unsigned long long
         
         %hi - short
         %hu - unsigned short
         
         */
        
        // SENDING A MSG TO NIL
        // In other languages, this would cause a crash. But not in Objective C
        id setToNil;
        setToNil = nil;
        int willBeZero = [setToNil count];
        NSLog(@"This will not crash, it will just be 0 => %i", willBeZero);
        // Even if willBeZero was a pointer, it would have been nil
        // Other types it may be unpredictable
        
        // STRINGS
        
        // 1. C string <--> Objective C
        
        const char *foo = "Blah blah";
        NSString *bar;
        // Create an NSString from a C string
        bar = [NSString stringWithUTF8String:foo];
        
        // Create a C string from an NSString
        foo = [bar UTF8String];
        
        //ARRAYS
        
        NSMutableArray *array; // Just a pointer, no array exists yet
        array = [[NSMutableArray alloc] init]; // Here we have array creation and pointer now points to something meaningful
        int i;
        for (i = 0; i < 10; i++)
        {
            NSNumber *newNumber =
            [[NSNumber alloc] initWithInt:(i * 3)];
            [array addObject:newNumber]; // List of pointers to NSNumber objects
        }
        
        for ( i = 0; i < 10; i++)
        {
            NSNumber *numberToPrint = [array objectAtIndex:i];
            NSLog(@"The number at index %d is %@",  i, numberToPrint);
        }
        
        
        
    }
    return 0;
}
