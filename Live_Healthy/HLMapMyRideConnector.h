//
//  HLMapMyRideConnector.h
//  Live_Healthy
//
//  Created by Milton D. Mitjans on 4/25/13.
//  Copyright (c) 2013 Milton D. Mitjans. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFOAuth1Client.h"

@interface HLMapMyRideConnector : NSObject

@property (strong, nonatomic) AFOAuth1Client *mapMyRideClient;

-(void) connectWithMapMyRide:(NSString*) site : (NSString*) secretKey : (NSString*) key;

@end
