//
//  AOCWishListDataService.h
//  Markets
//
//  Created by Andrei Oprea on 22/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AOCItem.h"

@protocol AOCWishListProtocol;
@interface AOCWishListDataService : NSObject

+ (AOCWishListDataService*) wishListDataService;

- (void) put:(AOCItem*) item;
- (void) remove:(AOCItem*) item;
- (NSSet*) items;

-(void) registerObserver:(id<AOCWishListProtocol>) delegate;
-(void) unregisterObserver:(id<AOCWishListProtocol>) delegate;
@end
