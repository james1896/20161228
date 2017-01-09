//
//  IVIMobileDataManager.m
//  IVI_Mobile
//
//  Created by toby on 31/12/2016.
//  Copyright © 2016 toby. All rights reserved.
//

#import "IVIMobileDataManager.h"
#import <SystemConfiguration/CaptiveNetwork.h>

static IVIMobileDataManager *instance = nil;

@interface IVIMobileDataManager()

@property(nonatomic,strong) IVIMobileUserData *userData;

@end

@implementation IVIMobileDataManager


/**
 *  单利
 */

+ (IVIMobileDataManager *)defaultDataManeger{

    static dispatch_once_t once;
    dispatch_once(&once,^{
        instance = [[self alloc]init];

    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{

    static dispatch_once_t once;

    dispatch_once(&once, ^{
        instance = [super allocWithZone:zone];
    });

    return instance;
}

- (id)copyWithZone:(struct _NSZone *)zone{

    return instance;
}


/**
 *  对数据 增、删、改、查
 */

- (void)saveUserData:(IVIMobileUserData *)userData{
    
    _userData = userData;
}

- (void)saveUserName:(NSString *)name{
    IVIMobileUserData *data = [[IVIMobileUserData alloc]init];
    data.userName = name;
    [self saveUserData:data];
}


/**
 *
 *  使用该方法需要添加 框架   #import <SystemConfiguration/CaptiveNetwork.h>
 *
 *  可以获得 BSSID(类似MAC地址) SSID(WIFI名字) SSIDDATA等WIFI信息
 
    例如:
            myDict打印：{
            BSSID = "8a:25:93:57:14:24";
            SSID = sichou;
            SSIDDATA = <73696368 6f75>;
            }
 *
 *
 */

+ (WIFIInfo *)getCurrentWIFIInfo{
    WIFIInfo *info = [[WIFIInfo alloc] init];
    
    CFArrayRef myArray = CNCopySupportedInterfaces();
    if (myArray != nil){
        NSDictionary* myDict = (__bridge NSDictionary *) CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0));
        if (myDict!=nil){
            info.BSSID = [myDict valueForKey:@"BSSID"];
             info.SSID = [myDict valueForKey:@"SSID"];
             info.SSIDDATA = [myDict valueForKey:@"SSIDDATA"];
        }
    }
    CFRelease(myArray);
    return info;
}


    /*******    WIFI功能实例      **********/
//
//-(NSString *)fetchSSIDInfo
//{
//    NSString *currentSSID = @"Not Found";
//    CFArrayRef myArray = CNCopySupportedInterfaces();
//    if (myArray != nil){
//        NSDictionary* myDict = (__bridge NSDictionary *) CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0));
//        if (myDict!=nil){
//            currentSSID=[myDict valueForKey:@"BSSID"];
//            /* myDict打印：{
//             BSSID = "8a:25:93:57:14:24";
//             SSID = sichou;
//             SSIDDATA = <73696368 6f75>;
//             }
//             */
//        } else {
//            currentSSID=@"<<NONE>>";
//        }
//    } else {
//        currentSSID=@"<<NONE>>";
//    }
//    //    NSDictionary *info = nil;
//    //    for (NSString *ifnam in ifs) {
//    //        info = (__bridge NSDictionary *)CNCopyCurrentNetworkInfo((CFStringRef)CFBridgingRetain(ifnam));
//    //    }
//    CFRelease(myArray);
//    return currentSSID;
//}

@end


/***************************    IVIMobileUserData   *****************************************/


@implementation IVIMobileUserData


@end


/***************************    WIFIInfo   *****************************************/

@implementation WIFIInfo

//init
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.SSID = @"<<NONE>>";
        self.BSSID = @"<<NONE>>";
        self.SSIDDATA = @"<<NONE>>";
    }
    return self;
}

@end
