//
//  HLServerConnector.h
//  Live_Healthy
//
//  Created by Milton D. Mitjans on 4/19/13.
//  Copyright (c) 2013 Milton D. Mitjans. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MKNetworkEngine.h"

@interface HLServerConnector : MKNetworkEngine

typedef void (^CurrencyResponseBlock)(NSString* rate);

//-(MKNetworkOperation*) currencyRateFor:(NSString*) sourceCurrency
//                            inCurrency:(NSString*) targetCurrency
//                     completionHandler:(CurrencyResponseBlock) completion
//                          errorHandler:(MKNKErrorBlock) error;

-(MKNetworkOperation*) callServer:(NSString*) site
                     completionHandler:(CurrencyResponseBlock) completionBlock
                          errorHandler:(MKNKErrorBlock) error;

@end
