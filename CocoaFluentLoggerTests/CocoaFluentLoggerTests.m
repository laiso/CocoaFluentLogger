#import <SenTestingKit/SenTestingKit.h>

#import "CocoaFluentLogger.h"

@interface CocoaFluentLoggerTests : SenTestCase
@property(nonatomic)CocoaFluentLogger* logger;
@end

@implementation CocoaFluentLoggerTests

- (void)setUp
{
  [super setUp];
  
  self.logger = [[CocoaFluentLogger alloc] initWithHost:@"192.168.0.9" port:24224 tagPrefix:@"debug"];
}

- (void)tearDown
{
  self.logger = nil;
  
  [super tearDown];
}

- (void)testPost
{
  [self.logger post:@"test" object:@{@"text": @"Hello!"}];
}

@end
