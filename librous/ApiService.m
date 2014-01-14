#import "ApiService.h"

@implementation ApiService

#if LOCAL
NSString *const host = @"http://librous.dev";
#else
NSString *const host = @"http://api.librous.com";
#endif

+ (NSURL *)root
{
    return [NSURL URLWithString:host];
}

static ApiService *_api;
+ (ApiService *)api
{
    if (_api == nil) {
        NSLog(@"API running against %@", host);
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _api = [[super alloc] initWithBaseURL:self.root sessionConfiguration:config];
    }
    return _api;
}

/**
 * (Used for testing)
 */
+ (void)hijackSessionWithProtocolClasses:(NSArray *)protocolClasses
{
    NSURLSessionConfiguration *hijackedConfig = [self api].session.configuration;
    hijackedConfig.protocolClasses = protocolClasses;
    [_api invalidateSessionCancelingTasks:YES];
    _api = [[super alloc] initWithBaseURL:self.root sessionConfiguration:hijackedConfig];
}

+ (void)version:(void (^)(NSString *version))success
{
    [_api GET:@"/"
            parameters:nil
               success:^(NSURLSessionDataTask *task, id responseObject) {
                   success(responseObject[@"version"]);
               }
               failure:^(NSURLSessionDataTask *task, NSError *error) {
                   @throw [NSException exceptionWithName:@"HTTP Error" reason:[error description] userInfo:nil];
               }];
}
\

@end
