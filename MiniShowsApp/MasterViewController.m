//
//  MasterViewController.m
//  MiniShowsApp
//
//  Created by Ricardo Maqueda on 18/06/14.
//  Copyright (c) 2014 Molestudio. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Show.h"
#import "CustomCellTableViewCell.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    // Modelo de prueba
    self.shows = [[NSMutableArray alloc] init];
    Show *show1 = [[Show alloc] init];
    show1.title = @"Perdidos";
    show1.episode = @"Episodio1";
    show1.state = @"No visto";
    show1.image = [UIImage imageNamed:@"show.jpeg"];
    show1.descShow = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed bibendum metus sed augue tempor, quis porta lorem pretium. Proin posuere sapien quis eleifend gravida. Phasellus luctus tempor euismod. Fusce in risus quis ligula imperdiet vulputate eu a elit. Ut vulputate fermentum diam eget tempus. Cras malesuada lorem vulputate, iaculis neque vitae, hendrerit nulla. Quisque eu leo sit amet augue malesuada rhoncus. Curabitur ut tempus neque, a gravida sem. Ut purus mauris, luctus id condimentum sit amet, tincidunt id neque. Maecenas ultrices velit nulla, in faucibus tellus lacinia dapibus. Nullam aliquam tincidunt libero in tincidunt. Donec sagittis risus a nisi dapibus, ac elementum tortor faucibus. Pellentesque sit amet ultrices eros, at porttitor metus. Nullam ipsum nibh, ullamcorper et interdum et, porta vitae metus.";
    
    Show *show2 = [[Show alloc] init];
    show2.title = @"Encontrados";
    show2.episode = @"Episodio1";
    show2.state = @"Visto";
    show2.image = [UIImage imageNamed:@"show.jpeg"];
    show2.descShow = @"Pellentesque molestie accumsan turpis, a lobortis metus suscipit ac. Maecenas aliquam risus at turpis imperdiet, pharetra dignissim ante congue. Donec non mi fringilla nisi commodo dignissim. Donec eu semper enim, eu adipiscing nulla. In pretium libero vel eros mattis, quis pulvinar felis dignissim. Etiam odio velit, facilisis ut quam et, condimentum gravida sem. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec aliquam est sit amet velit dignissim, eu laoreet ante faucibus. Aliquam consectetur lacus et lacinia lobortis. In lacinia mollis mi, a blandit elit elementum quis.";
    
    [self.shows addObject:show1];
    [self.shows addObject:show2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Show *show = [self.shows objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = show.title;
    cell.episodeLabel.text = show.episode;
    cell.stateLabel.text = show.state;
    
    cell.horizontalState.constant = 5;
    cell.verticalState.constant = 50;
    
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || ![[UIDevice currentDevice] orientation]) {
        cell.horizontalState.constant = 143;
        cell.verticalState.constant = 20;
    } 
    
    return cell;
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.tableView reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 100;
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || ![[UIDevice currentDevice] orientation]) {
        height = 120;
    }
    return height;
}

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *index = [self.tableView indexPathForCell:sender];
        DetailViewController *vc = [segue destinationViewController];
        vc.show = [self.shows objectAtIndex:index.row];
    }
}

@end
