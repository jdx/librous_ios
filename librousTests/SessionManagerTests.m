#import <XCTest/XCTest.h>
#import "TRVSMonitor.h"
#import "ApiService.h"

@interface SessionManagerTests : XCTestCase
@property (nonatomic, strong) ApiService *api;
@end

@implementation SessionManagerTests

- (void)setUp
{
    [super setUp];
    NSLog(@"%@", self.api);
    self.api = [ApiService sharedService];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testVersion
{
    TRVSMonitor *monitor = [TRVSMonitor monitor];
    [ApiService version:^(NSString *version) {
        XCTAssertEqualObjects(version, @"1.0");
        [monitor signal];
    }];
    [monitor wait];
}

@end
