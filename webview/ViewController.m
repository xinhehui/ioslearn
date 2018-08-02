//
//  ViewController.m
//  webview
//
//  Created by jinjiabin on 2018/7/25.
//  Copyright © 2018年 jinjiabin. All rights reserved.
//

#import "ViewController.h"
#import "Newc.h"
#import "wkViewController.h"
@interface ViewController (UIWebViewDelegate)
@property (weak, nonatomic) IBOutlet UIWebView *webView; ///< UIWebView
- (IBAction)jump2two:(id)sender;
//-(void)addbtn:(CGFloat)ydis,(NSString *)text;
@end

@implementation ViewController
- (IBAction)jump2two:(id)sender {
    //1.创建第二个子控制器
    Newc *two=[[Newc alloc]init];
    
    //2.把子控制器添加到导航控制器中
    //有什么办法能够拿到导航控制器？
    //只要当前控制器是导航控制器的子控制器，那么就可以通过该属性直接获取到当前控制器所在的导航控制器
    [self.navigationController pushViewController:two animated:YES];
}
- (IBAction)jump2wkwebview:(id)sender {
    //1.创建第二个子控制器
    wkViewController *two=[[wkViewController alloc]init];
    
    //2.把子控制器添加到导航控制器中
    //有什么办法能够拿到导航控制器？
    //只要当前控制器是导航控制器的子控制器，那么就可以通过该属性直接获取到当前控制器所在的导航控制器
    [self.navigationController pushViewController:two animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1.创建按钮（UIButton）
    [self addbtn:0 ydis:100 sizew:100 sizeh:100 text:@"uiwebview" bg:UIColor.redColor   click:@selector(buttonPrint)];
    [self addbtn:0 ydis:200 sizew:100 sizeh:100 text:@"wkwebview" bg:UIColor.orangeColor click:@selector(buttonPrint2)];
        //控制当前控制器对应的导航条显示的内容
    self.navigationItem.title=@"第一个界面";
        //修改返回按钮显示的内容
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回一" style:UIBarButtonItemStylePlain target:nil action:nil];

    
    }
- (void)buttonPrint{
    
    printf("测试打印");
//    [self jump2two:nil];
    //1.创建第二个子控制/Users/a001793/Library/Autosave Information/webview/webview/ViewController.m器
    Newc *two=[[Newc alloc]init];
    
    //2.把子控制器添加到导航控制器中
    //有什么办法能够拿到导航控制器？
    //只要当前控制器是导航控制器的子控制器，那么就可以通过该属性直接获取到当前控制器所在的导航控制器
    [self.navigationController pushViewController:two animated:YES];

    //Newc *newc = [[Newc alloc] init];
    //[self presentViewController:newc animated:YES completion:nil];
}
- (void)buttonPrint2{
    
    printf("测试打印2");
    //    [self jump2two:nil];
    //1.创建第二个子控制/Users/a001793/Library/Autosave Information/webview/webview/ViewController.m器
    wkViewController *two=[[wkViewController alloc]init];
    
    //2.把子控制器添加到导航控制器中
    //有什么办法能够拿到导航控制器？
    //只要当前控制器是导航控制器的子控制器，那么就可以通过该属性直接获取到当前控制器所在的导航控制器
    [self.navigationController pushViewController:two animated:YES];
    
    //Newc *newc = [[Newc alloc] init];
    //[self presentViewController:newc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addbtn:(CGFloat)xdis ydis:(CGFloat)ydis sizew:(CGFloat)sizew sizeh:(CGFloat)sizeh text:(NSString *)text bg:(UIColor *)bg click:(SEL)click{
    UIButton *button = [[UIButton alloc]init];
    
    //2.设置按钮上显示的文字
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitle:@"摸我干啥" forState:UIControlStateHighlighted];
    
    //设置文字颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    [button setBackgroundColor:bg];
    //5.设置frame属性（位置和大小）
    button.frame = CGRectMake(xdis, ydis, sizew,sizeh);
    
    //6.通过代码为控件注册一个单机事件
    [button addTarget:self action:click forControlEvents:UIControlEventTouchUpInside];
    
    //控制当前控制器对应的导航条显示的内容
    //    self.navigationItem.title=@"第一个界面";
    //修改返回按钮显示的内容
    //self.navigation
    //    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回一" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //7.把动态创建的控件添加到控制器的view中
    [self.view addSubview:button];

}

@end
