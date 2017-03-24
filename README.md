# MVVMDemo
MVVM在iOS应用的Demo，主要通过经典的TableView来演示

MVVM来自[微软](https://msdn.microsoft.com/en-us/library/hh848246.aspx)，是一个相当不错的架构模式。

首先了解一下MVVM的架构

![MVVM](http://teehanlax.com.s3.amazonaws.com/wordpress/wp-content/uploads/mvvm1.png)

图片来自http://www.teehanlax.com/blog/model-view-viewmodel-for-ios/

### MVVMDemo的架构

![](http://7u2k5i.com1.z0.glb.clouddn.com/github_mvvmdemo1.png?imageMogr2/thumbnail/!50p)

**Model**:  数据的模型

**View**:  其实包括View和ViewController两部分，统称为View

**ViewModel**:  本Demo，主要是处理网络请求，把获取的数据显示在TableView上

另外

**TableViewProtocol**:  为了避免ViewController太重，我把TableView的DataSource和Delegate分离出来

### MVVMDemo的效果预览

![](http://7u2k5i.com1.z0.glb.clouddn.com/github_mvvmdemo_appfile.png?imageMogr2/thumbnail/!40p)

参考链接：

[Model-View-ViewModel for iOS (译)](http://www.cnblogs.com/brycezhang/p/3840567.html)

copyright (c) 2015 coderyi.all rights reserved.
