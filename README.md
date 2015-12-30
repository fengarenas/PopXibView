# PopXibView

* 用于方便弹出的自定义的xib View
* xib必须遵循苹果官方关于约束设置的原则

![GIF Demo](http://7xljbp.com1.z0.glb.clouddn.com/PopXibView.gif)

## Install
```
import "PopUpContainer.h"
```

## Usage
```
  //load xib
  PopUpView *popView = [[[NSBundle mainBundle]loadNibNamed:@"PopUpView" owner:self options:nil]firstObject];
  //create container
  PopUpContainer *container = [PopUpContainer containView:popView];
  //show
  [container showInView:self.view];
```

## Author
**FengJun** e-mail:<fengarenas@126.com> Blog:[DevFeng](http://devfeng.com/)
