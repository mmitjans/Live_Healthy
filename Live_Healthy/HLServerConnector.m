//
//  HLServerConnector.m
//  Live_Healthy
//
//  Created by Milton D. Mitjans on 4/19/13.
//  Copyright (c) 2013 Milton D. Mitjans. All rights reserved.
//

#import "HLServerConnector.h"

@implementation HLServerConnector

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
         NSDictionary *data = [completedOperation responseJSON];
         
         
//         NSString *valueString = [completedOperation responseString];
//         DLog(@"%@", valueString);
//          
//         if([completedOperation isCachedResponse]) {
//             DLog(@"Data from cache %@", [completedOperation responseString]);
//         }
//         else {
//             DLog(@"Data from server %@", [completedOperation responseString]);
//         }
         
         completionBlock(data);
         
     } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;

    
}

@end
