//
//  HLServerConnector.m
//  Live_Healthy
//
//  Created by Milton D. Mitjans on 4/19/13.
//  Copyright (c) 2013 Milton D. Mitjans. All rights reserved.
//

#import "HLServerConnector.h"

#define YAHOO_URL(__C1__, __C2__) [NSString stringWithFormat:@"d/quotes.csv?e=.csv&f=sl1d1t1&s=%@%@=X", __C1__, __C2__]

@implementation HLServerConnector
/*
-(MKNetworkOperation*) currencyRateFor:(NSString*) sourceCurrency
                            inCurrency:(NSString*) targetCurrency
                     completionHandler:(CurrencyResponseBlock) completionBlock
                          errorHandler:(MKNKErrorBlock) errorBlock {
    
    MKNetworkOperation *op = [self operationWithPath:YAHOO_URL(sourceCurrency, targetCurrency)
                                              params:nil
                                          httpMethod:@"GET"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         // the completionBlock will be called twice.
         // if you are interested only in new values, move that code within the else block
         
         NSString *valueString = [[completedOperation responseString] componentsSeparatedByString:@","][1];
         DLog(@"%@", valueString);
         
         if([completedOperation isCachedResponse]) {
             DLog(@"Data from cache %@", [completedOperation responseString]);
         }
         else {
             DLog(@"Data from server %@", [completedOperation responseString]);
         }
         
         completionBlock([valueString doubleValue]);
         
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
         
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
}*/

-(MKNetworkOperation*) callServer:(NSString*) site
                completionHandler:(CurrencyResponseBlock) completionBlock
                     errorHandler:(MKNKErrorBlock) errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:site
                                              params:nil
                                          httpMethod:@"GET"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         // the completionBlock will be called twice.
         // if you are interested only in new values, move that code within the else block
         
         NSString *valueString = [completedOperation responseString];
         DLog(@"%@", valueString);
          
         if([completedOperation isCachedResponse]) {
             DLog(@"Data from cache %@", [completedOperation responseString]);
         }
         else {
             DLog(@"Data from server %@", [completedOperation responseString]);
         }
         
         completionBlock(valueString);
         
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
         
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;

    
}

@end
