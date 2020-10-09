//
//  AWSUIDevice
//
//  Created by Justin Greenfield on 8/23/16.
//  Copyright © 2016 Weather Decision Technologies, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<CoreTelephony/CTTelephonyNetworkInfo.h>) && TARGET_OS_IPHONE
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#define __AWS_HAS_CORE_TELEPHONY__
#endif


#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
//#import <CoreTelephony/CTTelephonyNetworkInfo.h>
//#import <CoreTelephony/CTCarrier.h>
#import <sys/utsname.h>
#define AWSUIDevice UIDevice
#define AWSUIScreen UIScreen
#else

@interface AWSUIDevice : NSObject

+ (instancetype) currentDevice;

@property (nonatomic, readonly) NSString* systemName;
@property (nonatomic, readonly) NSString* systemVersion;
@property (nonatomic, readonly) NSString* model;
@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) NSUUID* identifierForVendor;

@end


@interface AWSUIScreen: NSObject

+ (instancetype) mainScreen;

@property (nonatomic, readonly) CGRect nativeBounds;

@end

#endif

@interface AWSCTTelephony : NSObject

@property (nonatomic, readonly) NSString* countryCode;
@property (nonatomic, readonly) NSString* carrierName;
@property (nonatomic, readonly) NSString* networkType;

@end

