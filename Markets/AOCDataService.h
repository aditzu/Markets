//
//  AOCDataService.h
//  Markets
//
//  Created by Andrei Oprea on 22/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol AOCWishListProtocol;
@class AOCWishListDataService;
@interface AOCDataService : NSObject

+(void) registerWishListObserver:(id<AOCWishListProtocol>) delegate;
+(void) unregisterWishListObserver:(id<AOCWishListProtocol>) delegate;
+(AOCWishListDataService*) wishListDataService;
@end

@protocol AOCWishListProtocol <NSObject>
-(void) wishListUpdated;
@end

