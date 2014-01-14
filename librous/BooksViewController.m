#import "BooksViewController.h"

@implementation BooksViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.label.text = @"foobar";
    [[ApiService api] GET:@"/books"
                             parameters:nil
                                success:^(NSURLSessionDataTask *task, id responseObject) {
                                    self.label.text = responseObject[@"books"][0][@"title"];
                                }
                                failure:^(NSURLSessionDataTask *task, NSError *error) {
                                    NSLog(@"%@", error);
                                }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
