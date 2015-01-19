//
//  AlarmStore.h
//  LocationAlarm
//
//  Created by Michael Spearman on 1/17/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AlarmAnnotation;

@interface AlarmStore : NSObject

@property (nonatomic, strong) NSArray *allAlarms;

+ (instancetype) sharedStore;
- (void) addAlarm:(AlarmAnnotation *)alarm;
- (void) removeAlarm:(AlarmAnnotation *)alarm;

@end
