#import "Kiwi.h"
#import "ApiService.h"
#import "Nocilla.h"
#import "LSHTTPStubURLProtocol.h"

SPEC_BEGIN(ApiServiceSpec)

beforeAll(^{
    [[LSNocilla sharedInstance] start];
    [ApiService hijackSessionWithProtocolClasses:@[[LSHTTPStubURLProtocol class]]];
});
afterAll(^{
    [[LSNocilla sharedInstance] stop];
});
afterEach(^{
    [[LSNocilla sharedInstance] clearStubs];
});

describe(@"ApiService", ^{
    it(@"gets the version", ^{
        NSDictionary *json = @{@"version": @"1.0"};
        stubRequest(@"GET", @"http://librous.dev/")
        .andReturn(200)
        .withHeader(@"Content-Type", @"application/json")
        .withBody([NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil]);
                  
        __block NSString *version = nil;
        [ApiService version:^(NSString *v) {
            version = v;
        }];
        [[expectFutureValue(version) shouldEventually] equal:@"1.0"];
    });
});

SPEC_END