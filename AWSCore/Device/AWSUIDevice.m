//
//  AWSUIDevice
//
//  Created by Justin Greenfield on 8/23/16.
//  Copyright © 2016 Weather Decision Technologies, Inc. All rights reserved.
//

#import <AWSUIDevice.h>
#include <sys/sysctl.h>
#import <AWSUICKeychainStore.h>

#if TARGET_OS_IPHONE
#else

@implementation AWSUIDevice

+ (instancetype) currentDevice {
	static dispatch_once_t predicate = 0;
	__strong static id _sharedObject = nil;
	dispatch_once(&predicate, ^{
		_sharedObject = [[self alloc] init];
	});
	return _sharedObject;
}

- (NSString*)name {
	return [[NSHost currentHost] localizedName];
}

- (NSString*) systemName {
	return @"OS X";
}

- (NSString*) systemVersion {
	return [NSProcessInfo processInfo].operatingSystemVersionString;
}

- (NSString*) getSysInfo:(char*)typeSpecifier {
	size_t infoSize;
	sysctlbyname(typeSpecifier, NULL, &infoSize, NULL, 0);
	
	char* sysinfo = malloc(infoSize);
	sysctlbyname(typeSpecifier, sysinfo, &infoSize, NULL, 0);
	
	NSString* infoString = [NSString stringWithCString:sysinfo encoding: NSUTF8StringEncoding];
	
	free(sysinfo);
	return infoString;
}

- (NSString*) model {
	return [self getSysInfo:"hw.model"];
}

- (NSUUID*)identifierForVendor {
	NSString* service = [NSString stringWithFormat:@"%@.%@", [[NSBundle mainBundle] bundleIdentifier], @"AWSCognito.UDID"];
	NSString* key = @"aws_udid_key";
	NSString* uuidString = [AWSUICKeyChainStore stringForKey:key
													 service:service accessGroup:nil];
	if (uuidString) {
		return [[NSUUID alloc] initWithUUIDString:uuidString];
	}
	
	NSUUID* uuid = [[NSUUID alloc] init];
	[AWSUICKeyChainStore setString:uuid.UUIDString forKey:key service:service accessGroup:nil];
	return uuid;
}

@end

@interface AWSUIScreen ()
@property (nonatomic, strong) NSScreen *screen;
@end

@implementation AWSUIScreen

+(instancetype) mainScreen {
	static dispatch_once_t predicate = 0;
	__strong static id _sharedObject = nil;
	dispatch_once(&predicate, ^{
		_sharedObject = [[self alloc] init];
	});
	return _sharedObject;
}

- (instancetype)init {

	if (self = [super init]) {
		_screen = [NSScreen mainScreen];
	}
	return self;
}

- (CGRect) nativeBounds {
	return [_screen frame];
}

@end

#endif

@implementation AWSCTTelephony

#if TARGET_OS_IPHONE

- (NSString*) countryCode {
	return [[[[CTTelephonyNetworkInfo alloc] init] subscriberCellularProvider] isoCountryCode];
}

- (NSString*) carrierName {
	return [[[[CTTelephonyNetworkInfo alloc] init] subscriberCellularProvider] carrierName];
}

- (NSString*) networkType {
	return [[[CTTelephonyNetworkInfo alloc] init] currentRadioAccessTechnology];
}

#else

- (NSString*) countryCode {
	return nil;
}

- (NSString*) carrierName {
	return nil;
}

- (NSString*) networkType {
	return nil;
}

#endif

@end

