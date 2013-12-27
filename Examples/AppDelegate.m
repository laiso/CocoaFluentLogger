#import "AppDelegate.h"

#import "CocoaFluentLogger.h"

@implementation AppDelegate

static NSString * const kFluentdHost = @"192.168.0.24";
static NSUInteger  const kFluentdPort = 24224;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  
  [self addSendButton];
  
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)addSendButton
{
  UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [sendButton setTitle:@"Send" forState:UIControlStateNormal];
  sendButton.frame = CGRectMake(0, 0, 44, 100);
  sendButton.center = self.window.center;
  [sendButton addTarget:self action:@selector(onSendButton:) forControlEvents:UIControlEventTouchDown];
  [self.window addSubview:sendButton];
}

- (void)onSendButton:(id)sender
{
  CocoaFluentLogger* logger = [[CocoaFluentLogger alloc] initWithHost:kFluentdHost port:kFluentdPort tagPrefix:@"debug"];
  [logger connect];
  
  int i = 10;
  while (i--) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
      [NSThread sleepForTimeInterval:arc4random_uniform(10)];
      [logger post:@"test" object:@{@"text": [NSString stringWithFormat:@"Hello! I'm %@. (%d)", [[UIDevice currentDevice] name], i]}];
    });
  }
  
  //[logger disConnect];
}

@end
