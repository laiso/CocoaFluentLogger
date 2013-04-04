#import "AppDelegate.h"

#import "CocoaFluentLogger.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

  CocoaFluentLogger* logger = [[CocoaFluentLogger alloc] initWithHost:@"192.168.0.9" port:24224 tagPrefix:@"debug"];
  [logger connect];
  [logger post:@"test" object:@{@"text": [NSString stringWithFormat:@"Hello! I'm %@.", [UIDevice currentDevice].name]}];
  //[logger disConnect];
  
  [self.window makeKeyAndVisible];
  return YES;
}

@end
