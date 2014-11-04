//
//  NewsPageViewController.m
//  ZNews-prototype2
//
//  Created by Frank Zheng on 11/4/14.
//  Copyright (c) 2014 Frank Zheng. All rights reserved.
//

#import "NewsPageViewController.h"
#import "ViewController.h"

static NSArray *Categories = nil;

@interface NewsPageViewController ()

@end

@implementation NewsPageViewController

+(void)initialize {
    Categories = @[@"Hot", @"Technology", @"Finance"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSource = self;
    self.delegate = self;
    
    ViewController *startingViewController = [self viewControllerAtIndex:0];
    
    [self setViewControllers:@[startingViewController]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO completion:nil];
    self.navigationItem.title = Categories[0];
    
    //[self didMoveToParentViewController:self];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
}

- (ViewController *)viewControllerAtIndex:(NSUInteger)index {
    if(Categories.count == 0 ||  index > Categories.count - 1) {
        return nil;
    }
    ViewController *viewController = [[ViewController alloc] init];
    viewController.data = Categories[index];
    return viewController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSLog(@"viewControllerBeforeViewController");
    NSUInteger index = [Categories indexOfObject:((ViewController *)viewController).data];
    if(index == 0 || index == NSNotFound) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSLog(@"viewControllerAfterViewController");
    NSUInteger index = [Categories indexOfObject:((ViewController *)viewController).data];
    if(index == NSNotFound || index == Categories.count - 1) {
        return nil;
    }
    index++;
    return [self viewControllerAtIndex:index];
}

- (void) pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    if(completed) {
        ViewController *cv = self.viewControllers[0];
        self.navigationItem.title = cv.data;
    }
    
}

@end
