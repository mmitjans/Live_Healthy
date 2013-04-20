//
//  HLPlansViewController.h
//  Live_Healthy
//
//  Created by Milton D. Mitjans on 4/17/13.
//  Copyright (c) 2013 Milton D. Mitjans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLServerConnector.h"

@interface HLPlansViewController : UITableViewController

@property(nonatomic, strong) NSMutableArray *plans;
@property (strong, nonatomic) HLServerConnector *serverConnector;
@property (strong, nonatomic) MKNetworkOperation *currencyOperation;
@end
