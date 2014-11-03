//
//  ViewController.m
//  ZNews-prototype2
//
//  Created by Frank Zheng on 11/3/14.
//  Copyright (c) 2014 Frank Zheng. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)onButtonTap:(id)sender {
    ChildViewController *child = [[ChildViewController alloc]init];
    [self.navigationController pushViewController:child animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"Master";
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                 style:UIBarButtonItemStylePlain
                                                                target:nil
                                                                action:nil];
    
    [self.navigationItem setBackBarButtonItem:backItem];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    
    //change the original y
#if 0
    self.view.bounds = CGRectOffset(self.view.bounds, 0, -64);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"show child view" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(10, 0, 100, 100);
    [button sizeToFit];
    
    [self.view addSubview:button];
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 48.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row %ld", indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"detail %ld", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChildViewController *child = [[ChildViewController alloc]init];
    [self.navigationController pushViewController:child animated:YES];
}


@end
