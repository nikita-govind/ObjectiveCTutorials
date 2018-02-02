//
//  Header.h
//  learningObjectiveC
//
//  Created by Nikita Govind on 2/2/18.
//  Copyright © 2018 Nikita Govind. All rights reserved.
//

#ifndef LotteryEntry_h
#define LotteryEntry_h

#import <Foundation/Foundation.h>

@interface LotteryEntry: NSObject
{
    
}

@property () NSDate *entryDate;
@property () int firstNumber;
@property () int secondNumber;

- (void)prepareRandomNumbers;

@end

#endif /* LotteryEntry_h */
