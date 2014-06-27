//
//  TFAppDelegate.m
//  URLSchemeApp
//
//  Created by LittleFin on 6/27/14.
//  Copyright (c) 2014 Michael Dattolo. All rights reserved.
//

#import "TFAppDelegate.h"


@implementation TFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // This is always called before openURL, even if app wasn't running when launched by a URL
    
    self.viewController = (TFViewController *)self.window.rootViewController;
    
    return YES;
}
							

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    NSLog(@"URL Scheme: %@", [url scheme]);
    NSLog(@"URL Host: %@", [url host]);
    NSLog(@"URL Path: %@", [url path]);
    NSLog(@"URL Query: %@", [url query]);

    if ( [[url host] isEqualToString:@"display"] && [[url path] isEqualToString:@"/word"]) {
        
        self.viewController.label.text = [url query];
        return YES;
    }
    
    
    // If we don't know how to handle the URL, don't do anything
    return NO;
}

@end
