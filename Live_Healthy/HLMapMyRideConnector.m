//
//  HLMapMyRideConnector.m
//  Live_Healthy
//
//  Created by Milton D. Mitjans on 4/25/13.
//  Copyright (c) 2013 Milton D. Mitjans. All rights reserved.
//

#import "HLMapMyRideConnector.h"

@implementation HLMapMyRideConnector


-(void) connectWithMapMyRide:(NSString*) site : (NSString*) secretKey : (NSString*) key
{
  self.mapMyRideClient =
    [[AFOAuth1Client alloc] initWithBaseURL:[NSURL URLWithString:site] key:key secret:secretKey];
    
  [self.mapMyRideClient authorizeUsingOAuthWithRequestTokenPath:@"oauth/request_token" userAuthorizationPath:@"oauth/authorize" callbackURL:[NSURL URLWithString:@"af-twitter://"] accessTokenPath:@"oauth/access_token" accessMethod:@"POST" success:^(AFOAuth1Token *accessToken) {
      
      //NSLog(@"Succes: %@", [accessToken.isExpired]);
      
    } failure:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end
