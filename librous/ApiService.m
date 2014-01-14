#import "ApiService.h"

@implementation ApiService

#if TARGET_IPHONE_SIMULATOR
NSString *const host = @"http://librous.dev";
#else
NSString *const host = @"http://api.librous.com";
#endif

static ApiService *sharedService;

+ (ApiService *)sharedService
{
    if (sharedService == nil) {
        NSURL *root = [NSURL URLWithString:host];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        sharedService = [[super alloc] initWithBaseURL:root sessionConfiguration:config];
    }
    return sharedService;
}

+ (void)version:(void (^)(NSString *version))success
{
    [sharedService GET:@"/"
            parameters:nil
               success:^(NSURLSessionDataTask *task, id responseObject) {
                   success(responseObject[@"version"]);
               }
               failure:^(NSURLSessionDataTask *task, NSError *error) {
                   @throw [NSException exceptionWithName:@"HTTP Error" reason:[error description] userInfo:nil];
               }];
}

@end
