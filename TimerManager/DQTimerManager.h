//
//  DQTimerManager.h
//  TimerManager
//
//  Created by apple on 2020/1/13.
//  Copyright © 2020 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DQTimerManager : NSObject
- (instancetype)initWithTimeInterval:(NSTimeInterval)time target:(id)target selector:(SEL)selector;

-(void)stopTimer;

@property (nonatomic,weak)id target;
@property (nonatomic,assign) SEL selector;

@end

NS_ASSUME_NONNULL_END
