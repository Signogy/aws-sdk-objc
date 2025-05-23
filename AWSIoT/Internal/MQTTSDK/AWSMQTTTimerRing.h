//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// A circular collection containing the messages that need to be retried at a given clock tick.
/// The maximum number of ticks is 60
@interface AWSMQTTTimerRing: NSObject

- (void)addMsgId:(NSNumber *)msgId atTick:(NSUInteger)tick;
- (void)removeMsgId:(NSNumber *)msgId atTick:(NSUInteger)tick;
- (NSArray<NSNumber *> *)allMsgIdsAtTick:(NSUInteger)tick;

@end

NS_ASSUME_NONNULL_END
