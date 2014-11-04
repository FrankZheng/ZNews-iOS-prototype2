//
//  ViewController.m
//  ZNews-prototype2
//
//  Created by Frank Zheng on 11/3/14.
//  Copyright (c) 2014 Frank Zheng. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController.h"

static NSString * const kCellIdentifier = @"Cell";
static const CGFloat kCellHeight = 90.0f;
static const CGFloat kCellImgWidth = 84.0f;
static const CGFloat kCellImgHeight = 84.0f;
static const CGFloat kCellImgTitleSpacing = 5.0f;
static const CGFloat kCellPaddingRight = 10.0f;
static const CGFloat kCellPaddingLeft = 5.0f;
static const CGFloat kCellPaddingTop = 3.0f;
static const CGFloat kCellPaddingBottom = 3.0f;
static const CGFloat kCellDetailWidth = 50.0f;
static const CGFloat kCellDetailHeight = 20.0f;

@interface MyCell : UITableViewCell

@end

@implementation MyCell

- (instancetype)init {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
    if(self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat startX = kCellPaddingLeft;
    self.imageView.frame = CGRectMake(startX, kCellPaddingTop, kCellImgWidth, kCellImgHeight);
    
    startX += CGRectGetWidth(self.imageView.frame) + kCellImgTitleSpacing;
    
    self.textLabel.frame = CGRectMake(startX,
                                      kCellPaddingTop,
                                      CGRectGetWidth(self.bounds) - startX - kCellPaddingRight,
                                      CGRectGetHeight(self.bounds) - kCellPaddingTop - kCellPaddingBottom);
    
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.textLabel.numberOfLines = 0;
    
    self.detailTextLabel.frame = CGRectMake(CGRectGetWidth(self.bounds) - kCellPaddingRight - kCellDetailWidth,
                                            CGRectGetHeight(self.bounds) - kCellDetailHeight - kCellPaddingBottom,
                                            kCellDetailWidth,
                                            kCellDetailHeight);
    self.detailTextLabel.textAlignment = NSTextAlignmentRight;
    self.detailTextLabel.font = [UIFont italicSystemFontOfSize:10];
    
    self.imageView.image = [UIImage imageNamed:@"thumbnail_placeholder"];
    
}

@end


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
    self.navigationItem.title = self.data;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                 style:UIBarButtonItemStylePlain
                                                                target:nil
                                                                action:nil];
    
    [self.navigationItem setBackBarButtonItem:backItem];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
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
    NSLog(@"offest is %f, %f", self.tableView.contentOffset.x, self.tableView.contentOffset.y);
    
    self.tableView.contentInset = UIEdgeInsetsMake(64.0f, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if(cell == nil) {
        cell = [[MyCell alloc] init];
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row looooooooooooooooooooooooooooooooooooooooooog %ld", indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"detail %ld", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChildViewController *child = [[ChildViewController alloc]init];
    [self.navigationController pushViewController:child animated:YES];
}


@end
