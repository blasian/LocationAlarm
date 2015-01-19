//
//  AlarmStore.m
//  LocationAlarm
//
//  Created by Michael Spearman on 1/17/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import "AlarmStore.h"

@interface AlarmStore ()

@property (nonatomic) NSMutableArray *privateStore;

@end

@implementation AlarmStore

+ (instancetype) sharedStore {
    static AlarmStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc ] initPrivate];
    }
    return sharedStore;
}

- (instancetype) init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use designated init: [AlarmStore sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype) initPrivate {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSArray *)allAlarms {
    NSMutableArray *all = [[NSMutableArray alloc] init];
    for (AlarmAnnotation *alarm in _privateStore) {
        [all addObject:alarm];
    }
    return all;
}

- (void)addAlarm:(AlarmAnnotation *)alarm {
    [_privateStore addObject:alarm];
}

-(void)removeAlarm:(AlarmAnnotation *)alarm {
    [_privateStore removeObject:alarm];
}

@end
