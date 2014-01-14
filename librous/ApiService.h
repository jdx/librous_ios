#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface ApiService : AFHTTPSessionManager

+ (ApiService *)api;
+ (void)hijackSessionWithProtocolClasses:(NSArray *)protocolClasses;
+ (void)version:(void (^)(NSString *))success;

@end