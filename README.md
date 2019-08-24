# NavigationThings
导航栏的一些设置及注意事项

## 导航栏颜色
通常我们的导航栏的颜色都是自定义的，要修改导航栏颜色如下修改:
```
navigationBar.barTintColor = [UIColor yellowColor];
```
## 导航栏标题设置
```
navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
```
## 导航栏返回按钮设置
1. 自定义方式
```
        UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
        [backBtn setTitle:@"去返回" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(toPop) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        viewController.navigationItem.leftBarButtonItem = item;
```
这种会离屏幕左边会有较大的的间隙，我们可以调整`titleEdgeInsets`和`imageEdgeInsets`。

2. 使用系统实现自定义
第一步：设置图片与颜色
```
  navigationBar.backIndicatorImage = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationBar.backIndicatorTransitionMaskImage = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationBar.tintColor = [UIColor redColor];
```
第二步：设置文字
```
viewcontroller.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:viewController.title style:UIBarButtonItemStylePlain target:self action:@selector(toPop)];
```
通过设置`backBarButtonItem`来实现;

以上两种都可以实现返回按钮的自定义。但有些细微的区别，在侧滑返回时，两种的动画效果不同。第二种是
系统的效果，第一种的话是图片与文字一起慢慢变透明的效果。

## 使用
这里设置可以在单个控制器中去实现，但更好的方式自定义一个UINavigationController，所有根控制器都用自定义的导航控制器就可以很方便的实现了。具体看代码实现。



## 导航栏透明
在业务场景中，很多地方需要把一个页面的导航栏设为透明的。设置透明本身很简单：
```
[self.navigationController setNavigationBarHidden:YES animated:animated];
```
### 控制显示隐藏
在大多数场景下，其实不是所有的要隐藏的，以上代码的作用是让全部控制器都隐藏了。所以我们就要做处理：
```
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
```
*再这里有个问题，有些人会遇到切换tab时，隐藏的导航栏会有个往上消失的动画。其实只需要把`setNavigationBarHidden`中的`animated`设置为方法传进来的值就行，不要自己写死。

### 便捷
每个控制器中这么写很糟心，我们需要更好的解决办法：
#### 新建一个分类
新建一个UIViewController分类，该分类有一个属性`isNavbarHidden`，用运行时实现它。

#### 设置
```
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController.isNavbarHidden) {
        [self setNavigationBarHidden:YES animated:animated];
    }else{
        [self setNavigationBarHidden:NO animated:animated];
    }
}
```
在需要隐藏的控制器中设置isNavbarHidden即可。



