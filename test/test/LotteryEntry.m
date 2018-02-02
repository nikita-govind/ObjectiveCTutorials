//
//  LotteryEntry.m
//  learningObjectiveC
//
//  Created by Nikita Govind on 2/2/18.
//  Copyright © 2018 Nikita Govind. All rights reserved.
//

#import "LotteryEntry.h"

@implementation LotteryEntry

@synthesize entryDate;
@synthesize firstNumber;
@synthesize secondNumber;

- (id)initWithEntryDate:(NSDate*) date;
{
    // First call the superclass's initilizer
    self = [super init];
    
    // Test the value of the init bec initializers of some Cocoa classes will return nil if initialization was impossible.
    if (self)
    {
        NSAssert(date != nil, @"Argument must be non-nil");
        //NSAssert(date == nil, @"Argument must be non-nil");
        // We want assertions to be raised only in the Debug version, not the release version
        // So in Project -> Build Settings -> Preprocessor macros -> Release - add NS_BLOCK_ASSERTIONS
        // No build in release mode and no exception will be raised (Product -> Edit Scheme -> Toggle Debug to Release)
        entryDate = date;
        // Then call your own initializer
        firstNumber = ((int)random() % 100) + 1;
        secondNumber = ((int)random() % 100) + 1;
    }
    
    // Self is a pointer pointing to the object calling this method ie init here (like a this)
    return self;
}

- (void) prepareRandomNumbers
{
    firstNumber = ((int)random() % 100) + 1;
    secondNumber = ((int)random() % 100) + 1;
}

@end

