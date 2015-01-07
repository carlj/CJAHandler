#CJAHandler
Implementation of the Handler Pattern for obj-c
  
##Installation
Just drag&drop the file that are located in the ```CJAHandler``` folder or add the following line to you podfile

##Usage
First check out the example Project for further examples

``` objc
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Example Property Handler" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 10, 100, 100);
    [self.view addSubview:button];
    
    self.button = button;
    
    NSArray *handlers = @[
                          [CJAExamplePropertyHandler new]
                          ];
    
    self.manager = [[CJAHandlerManager alloc] initWithHandlers:handlers];
    [self.manager registerSourceObjects:@[self]];
}
```

##License
MIT License