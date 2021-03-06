//
//  HLPlansViewController.m
//  Live_Healthy
//
//  Created by Milton D. Mitjans on 4/17/13.
//  Copyright (c) 2013 Milton D. Mitjans. All rights reserved.
//

#import "HLPlansViewController.h"
#import "HLPlan.h"

@interface HLPlansViewController ()

@end

@implementation HLPlansViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.serverConnector = [[HLServerConnector alloc] init];
    self.myMyRideConnector = [[HLMapMyRideConnector alloc] init];
    [self.myMyRideConnector connectWithMapMyRide:@"http://127.0.0.1:8000/" :@"4oFCF0AjP4PQDUaCh5RQ" :@"NxAihESVsdUXSUxtHrml2VBHA0xKofYKmmGS01KaSs"];
    
    
//    [self.serverConnector callServer:@"http://127.0.0.1:8000/" completionHandler:^(NSDictionary *msgReceived) {
//        
//        NSString *text = [msgReceived objectForKey:@"name"];
//        
//        [[[UIAlertView alloc] initWithTitle:@"Today's Singapore Dollar Rates"
//                                    message:text
//                                   delegate:nil
//                          cancelButtonTitle:NSLocalizedString(@"Dismiss", @"")
//                          otherButtonTitles:nil] show];
//        
//    } ];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.plans count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"PlanCell"];
    HLPlan *plan = [self.plans objectAtIndex:indexPath.row];
	cell.textLabel.text = plan.planName;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
