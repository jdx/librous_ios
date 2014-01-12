#import "SessionManager.h"

@implementation SessionManager

static SessionManager *sharedSessionManager;

+ (SessionManager *)sharedManager
{
    if (sharedSessionManager == nil) {
        NSURL *host = [NSURL URLWithString:@"http://api.librous.com"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        sharedSessionManager = [[super alloc] initWithBaseURL:host sessionConfiguration:config];
    }
    return sharedSessionManager;
}

@end
