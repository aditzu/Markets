//
//  AOCItem.h
//  Markets
//
//  Created by Andrei Oprea on 21/10/14.
//  Copyright (c) 2014 AOC Dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AOCItem : NSObject

@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) NSString* URL;
@property (nonatomic,strong) NSString* description;

+(AOCItem*) itemWith:(NSString*)title andURL:(NSString*) URL;
+(AOCItem*) itemWith:(NSString *)title andURL:(NSString *)URL description:(NSString*) description;
@end
