#import <Foundation/Foundation.h>

@interface CocoaFluentLogger : NSObject

+ (id)loggerWithHost:(NSString *)host;
+ (id)loggerWithHost:(NSString *)host port:(NSUInteger)port;
+ (id)loggerWithHost:(NSString *)host port:(NSUInteger)port tagPrefix:(NSString *)prefix;

- (id)initWithHost:(NSString *)host;
- (id)initWithHost:(NSString *)host port:(NSUInteger)port;
- (id)initWithHost:(NSString *)host port:(NSUInteger)port tagPrefix:(NSString *)prefix;

- (void)connect;
- (void)disConnect;

- (void)post:(NSString *)tag object:(NSDictionary *)object;

@end
