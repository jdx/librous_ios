#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface ApiService : AFHTTPSessionManager

+ (ApiService *)sharedService;
+ (void)version:(void (^)(NSString *))success;

@end