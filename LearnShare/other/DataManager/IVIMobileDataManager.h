//
//  IVIMobileDataManager.h
//  IVI_Mobile
//
//  Created by toby on 31/12/2016.
//  Copyright © 2016 toby. All rights reserved.
//


/***            Introduction       
 *  包含类名
    WIFIInfo,IVIMobileUserData
 *
 */



#import <Foundation/Foundation.h>

/******************      WIFIInfo     ******************/


@interface WIFIInfo : NSObject

@property(nonatomic,copy) NSString *SSID;
@property(nonatomic,copy) NSString *BSSID;
@property(nonatomic,copy) NSString *SSIDDATA;

@end


/**************    IVIMobileUserData   ***************/



@interface IVIMobileUserData : NSObject

@property(nonatomic,strong) NSString *userName;

@end


/*******************************      IVIMobileDataManager     *****************************************/


@interface IVIMobileDataManager : NSObject

/**
 *  对外属性
 */
@property(nonatomic,strong,readonly) NSString *userName;

+ (IVIMobileDataManager *)defaultDataManeger;

/**
 *  获得wifi信息
 */

+ (WIFIInfo *)getCurrentWIFIInfo;

/**
 *  对用户信息增删改查
 */

- (void)saveUserName:(NSString *)name;

- (void)saveUserData:(IVIMobileUserData *)userData;



@end
