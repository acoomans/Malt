//
//  UIApplication+Malt.h
//  MaltDemo
//
//  Created by Arnaud Coomans on 3/19/13.
//  Copyright (c) 2013 acoomans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Malt)

- (NSString*)provisioningProfileFilePath;
- (NSString*)provisioningProfileContent;

// to be implemented yet
//- (BOOL)isDevelopmentApplication;
//- (BOOL)isAdhocDistributionApplication;

- (BOOL)isStoreDistributionApplication;
- (BOOL)isSimulatorApplication;

@end
