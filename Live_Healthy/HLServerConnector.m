//
//  HLServerConnector.m
//  Live_Healthy
//
//  Created by Milton D. Mitjans on 4/19/13.
//  Copyright (c) 2013 Milton D. Mitjans. All rights reserved.
//

#import "HLServerConnector.h"

#import "AFJSONRequestOperation.h"

@implementation HLServerConnector

-(void) callServer:(NSString *)site completionHandler:(CurrencyResponseBlock)completionBlock
{
    NSURL *url = [NSURL URLWithString:site];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSLog(@"JSON Received: %@", JSON);
        
        NSDictionary *data = JSON;
        
        completionBlock(data);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                     message:[NSString stringWithFormat:@"%@",error]
                                                    delegate:nil
                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [av show];
    }];
    
    [operation start];
}

@end
