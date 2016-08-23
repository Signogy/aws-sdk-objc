//
//  AWSDevice
//
//  Created by Justin Greenfield on 8/23/16.
//  Copyright © 2016 Weather Decision Technologies, Inc. All rights reserved.
//

#import <AWSDevice.h>
#include <sys/sysctl.h>

#if TARGET_OS_IPHONE
#else

@implementation AWSDevice

+ (instancetype) currentDevice {
	static dispatch_once_t predicate = 0;
	__strong static id _sharedObject = nil;
	dispatch_once(&predicate, ^{
		_sharedObject = [[self alloc] init];
	});
	return _sharedObject;
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

@end

#endif
