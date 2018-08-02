//
//  Newc.m
//  webview
//
//  Created by jinjiabin on 2018/7/25.
//  Copyright © 2018年 jinjiabin. All rights reserved.
//

#import "Newc.h"

@interface Newc (UIWebViewDelegate)
@property (weak, nonatomic) IBOutlet UIWebView *webView; ///< UIWebView
@end

@implementation Newc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addmyview];
    // Do any additional setup after loading the view.
}
-(void)addmyview{
    // 1.创建webview，并设置大小，"20"为状态栏高度
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - 20;
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, width, height)];
    NSURL *url = [NSURL URLWithString:@"http://10.16.0.248:10086/demo/demo/vertical.html?t=1"];//[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
    
    //清除cookies
    
    NSHTTPCookie *cookie;
    
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (cookie in [storage cookies])
        
    {
        
        [storage deleteCookie:cookie];
        
    }
    
    //    清除webView的缓存
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5.0]; // url的位置
    [webView loadRequest:urlRequest]; // 加载页面
    [self.view addSubview:webView];
    self.webView = webView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
