
//
//  AOCWishListDataService.m
//  Markets
//
//  Created by Andrei Oprea on 22/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import "AOCWishListDataService.h"
#import "AOCDataService.h"

@interface AOCWishListDataService()
{
    NSMutableOrderedSet* items;
    NSMutableArray* observers;
}

@end

@implementation AOCWishListDataService


+(AOCWishListDataService *)wishListDataService{
    return [[AOCWishListDataService alloc] init];

}

-(id)init{
    if(self=[super init])
    {
        items = [NSMutableOrderedSet orderedSet];
        observers = [NSMutableArray array];
    }
    return self;
}


- (void) put:(AOCItem*) item{
    [items addObject:item];
    for (id<AOCWishListProtocol> obs in observers) {
        [obs wishListUpdated];
    }
    
}
- (void )remove:(AOCItem*) item{
    [items removeObject:item];
    for (id<AOCWishListProtocol> obs in observers) {
        [obs wishListUpdated];
    }
}

- (NSSet *) items{
    return [items set];
}

-(void)registerObserver:(id<AOCWishListProtocol>)delegate
{
    [observers addObject:delegate];
}

-(void)unregisterObserver:(id<AOCWishListProtocol>)delegate
{
    [observers removeObject:delegate];
}

@end
