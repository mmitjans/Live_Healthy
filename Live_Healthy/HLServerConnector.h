//
//  HLServerConnector.h
//  Live_Healthy
//
//  Created by Milton D. Mitjans on 4/19/13.
//  Copyright (c) 2013 Milton D. Mitjans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLServerConnector : NSObject

// Response block
typedef void (^CurrencyResponseBlock)(NSDictionary *jsonData);

-(void) callServer:(NSString*) site completionHandler:(CurrencyResponseBlock) completionBlock;

@end