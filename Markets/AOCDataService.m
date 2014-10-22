//
//  AOCDataService.m
//  Markets
//
//  Created by Andrei Oprea on 22/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import "AOCDataService.h"
#import "AOCWishListDataService.h"


@implementation AOCDataService

static AOCWishListDataService* wishListDataService;

+(void)registerWishListObserver:(id<AOCWishListProtocol>)delegate
{
    [[AOCDataService wishListDataService] registerObserver:delegate];
}

+(void)unregisterWishListObserver:(id<AOCWishListProtocol>)delegate
{
    [[AOCDataService wishListDataService] unregisterObserver:delegate];
}

+(AOCWishListDataService *)wishListDataService
{
    if(!wishListDataService)
        wishListDataService = [AOCWishListDataService wishListDataService];
    return wishListDataService;
    
}

@end

