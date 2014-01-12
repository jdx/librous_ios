#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface SessionManager : AFHTTPSessionManager

+ (SessionManager *)sharedManager;

@end