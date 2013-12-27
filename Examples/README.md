Example App
===============

Start the fluentd in advance.

```fluentd -c ./fluent.conf```

Rewrite to the following values that suit your fluentd settings.

```objc
@implementation AppDelegate

static NSString * const kFluentdHost = @"192.168.0.24";
static NSUInteger  const kFluentdPort = 24224;
```

Tap the [Send] button, and the 10 messages will be send asynchronously by app.
