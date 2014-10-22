//
//  AOCItem.m
//  Markets
//
//  Created by Andrei Oprea on 21/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import "AOCItem.h"

@implementation AOCItem

+(AOCItem *)itemWith:(NSString *)title andURL:(NSString *)URL{
    AOCItem* item = [[AOCItem alloc]init];
    item.title = title;
    item.URL = URL;
    return item;
}

+(AOCItem *)itemWith:(NSString *)title andURL:(NSString *)URL description:(NSString *)description
{
    AOCItem* item = [AOCItem itemWith:title andURL:  URL];
    item.description  = description;
    return item;
}

-(BOOL)isEqual:(id)object{
    return self.title == ((AOCItem*)object).title;
}

-(NSUInteger)hash{
    return [self.title hash];
}

@end
