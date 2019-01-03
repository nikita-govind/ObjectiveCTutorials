//
//  main.m
//  learningObjectiveC
//
//  Created by Nikita Govind on 2/1/18.
//  Copyright © 2018 Nikita Govind. All rights reserved.
//

// Create Project -> Command line tool

#import <Foundation/Foundation.h>
#include "LotteryEntry.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // insert code here...
        NSLog(@"Hello, World!");
        
        //----------------------------------------------------------------------> PRINTING FORMATS <----------------------------------------------------------------------//
        //
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
        
        //----------------------------------------------------------------------> NSObject <----------------------------------------------------------------------//
        /*          NSObject
         ^
         |  Inherited from
         NSArray, NSString, etc
         ^
         |  Inherited from
         NSMutableArray
         */
        
        // NSObject common methods
        
        
        // SENDING A MSG TO NIL
        // In other languages, this would cause a crash. But not in Objective C
        id setToNil;
        setToNil = nil;
        int willBeZero = [setToNil count];
        NSLog(@"This will not crash, it will just be 0 => %i", willBeZero);
        // Even if willBeZero was a pointer, it would have been nil
        // Other types it may be unpredictable
        
        //----------------------------------------------------------------------> STRINGS <----------------------------------------------------------------------//
        
        // 1. C string <--> Objective C
        
        const char *foo = "Blah blah";
        NSString *bar;
        // Create an NSString from a C string
        bar = [NSString stringWithUTF8String:foo];
        
        // Create a C string from an NSString
        foo = [bar UTF8String];
        
        // 2. Comparing strings
        
        NSString *x = @"Nikita";
        NSString *y = @"Nikita";
        
        // Comparing the pointers
        if ( x== y)
            NSLog(@"Pointers are the same");
        else
            NSLog(@"Pointers are different");
        
        if ([x isEqual:y])
            NSLog(@"String values are the same");
        else
            NSLog(@"String values are different");
        
        // if x and y are instances of a class that has not overridden NSObject’s isEqual: method, the two expressions are equivalent.
        
        //----------------------------------------------------------------------> ARRAYS <----------------------------------------------------------------------//
        // * List of pointers, cannot have nil in it
        // * They cannot hold C primitive types - int, float
        
        
        // 1. NSArray
        // a. Immutable
        // b.
        // c.
        
        // 1. NSMutablearray
        // a. Mutable
        // b.
        // c.
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
        
        //----------------------------------------------------------------------> CLASSES <----------------------------------------------------------------------//
        NSDate *entryDate = [NSDate date];
        
        LotteryEntry *entry1 = [[LotteryEntry alloc] initWithEntryDate:entryDate];

        [entry1 setFirstNumber:5];
        [entry1 setSecondNumber:10];
        [entry1 prepareRandomNumbers];
        
        NSLog(@"Entry date = %@, Number 1 = %i, Number 2 = %i", [entry1 entryDate], [entry1 firstNumber], [entry1 secondNumber]);
        
        NSMutableArray *mArray = [[NSMutableArray alloc] init];
        [mArray addObject:entry1];
        
        // How messaging (ie calling a method) works?
        /*
         
         isa:
         - Objective C every object is basically a struct. isa pointer is a member of this struct.
         - This pointer every object has and that points to its Class (of whom it is an instance)
         - every class will also have an isa pointer that points to its superclass
         - As most classes have NSObject as their superclass, every class object has an isa pointer which points to its class.
         - The runtime follows this pointer to determine what class an object is, so it knows what selectors the object responds to, what its super class is, what properties the object has, and so on
         
         SEL:
         - The methods of a class are indexed by the selector. The selector is of type SEL (char*)
         [Table example below is asumming them to be ints)
         
         Example of when we send a message: [MyClassObject add1:anotherObject]
         
         |--------------|
         |NSObject Class|                                     (4)If still not found and no more superclasses left, it throws
         |--------------|                                     an EXCEPTION
         |Method | SEL  |                                   ^
         |--------------|                                   |
         | add1 |   12  |                                   | (3) Follow MyClass's isa pointerFound the SEL 12.
         | sub1 |   15  |                                   |   It points to its superclass NSObject Class
         |--------------|                                   |   Search for the SEL 12. FOUND
         
                ^
                |
         
         
         |--------------|
         |    MyClass   |
         |--------------|
         |Method | SEL  |
         |--------------|                                   ^
         | add2 |   22  |                                   |   (2) Translates to objc_msgSend(MyClassObject, 12, anotherObject);
         | sub2 |   25  |                                   |   ie objc_msgSend looks at MyClassObject's isa pointer.
         |--------------|                                   |   This isa pointer points to MyClass structure (variables, methods)
                                                            |   Now it checks for the SEL 12 (char*)
                ^                                           |   Not found. So proceed up to superclass and search again.
                |
        
         MyClass Object                                     (1) [MyClassObject add1:anotherObject]
         
         
         
         */
    }
    return 0;
}

