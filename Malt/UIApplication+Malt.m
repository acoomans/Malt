//
//  UIApplication+Malt.m
//  MaltDemo
//
//  Created by Arnaud Coomans on 3/19/13.
//  Copyright (c) 2013 acoomans. All rights reserved.
//

// implemented following http://stackoverflow.com/questions/3426467/how-to-determine-at-run-time-if-app-is-for-development-app-store-or-ad-hoc-dist

#import "UIApplication+Malt.h"

@implementation UIApplication (Malt)

- (NSString*)provisioningProfileFilePath {
    return [[NSBundle mainBundle] pathForResource:@"embedded.mobileprovision" ofType:nil];
}

- (NSString*)provisioningProfileContent {
    NSString *filePath = [self provisioningProfileFilePath];
    NSError *error = nil;
    if (filePath) {
        NSString *content = [NSString stringWithContentsOfFile:filePath
                                                     encoding:NSASCIIStringEncoding
                                                        error:&error];
        if (content) {
            return content;
        } else {
            NSLog(@"Error reading provisioning profile: %@", error);
        }
    }
    return nil;
}
/*
- (BOOL)isDevelopmentApplication {
    NSString *profile = [self provisioningProfileContent];
    if ([profile rangeOfString:@"Development Provisioning"].location != NSNotFound) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isAdhocDistributionApplication {
    
}
*/

- (BOOL)isStoreDistributionApplication {
    NSString *profile = [self provisioningProfileContent];
    if (
        profile &&
        ([profile rangeOfString:@"ProvisionedDevices"].location == NSNotFound)
        ) {
            return YES;
    }
    return NO;
}

- (BOOL)isSimulatorApplication {
#if TARGET_IPHONE_SIMULATOR
    return YES;
#else 
    return NO;
#endif
}

@end
