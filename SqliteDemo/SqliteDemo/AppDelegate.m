//
//  AppDelegate.m
//  SqliteDemo
//
//  Created by Trung Đức on 5/7/16.
//  Copyright © 2016 Trung Đức. All rights reserved.
//

#import "AppDelegate.h"

#define kDatabaseName                   @"Database.sqlite"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self copyDatabaseIfNeccessary];
    
    return YES;
}

- (NSString *)databasePath;
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    
    NSString *dbPath = [documentsDirectoryPath stringByAppendingPathComponent:kDatabaseName];
    
    return dbPath;
}

- (void)copyDatabaseIfNeccessary;
{
    NSString *dbPath = [[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:kDatabaseName];
    
    NSString *dbDocumentPath = [self databasePath];
    
    BOOL isExisted = [[NSFileManager defaultManager]fileExistsAtPath:dbDocumentPath];
    
    if (!isExisted) {
        BOOL copyResult = [[NSFileManager defaultManager]copyItemAtPath:dbPath toPath:dbDocumentPath error:NULL];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
