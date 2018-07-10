![](https://upload-images.jianshu.io/upload_images/790890-2822ae20a36c1506.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 目录
1. 介绍 Reveal 和 FLEX
2. 安装 MonkeyDev 和 Theos 环境
3. 对 ipa 进行脱壳处理。 
4. 集成 Reveal 和 FLEX
5. 成果演示 - 抖音APP示例
---

### 1. 介绍 Reveal 和 FLEX
#### Reveal 是什么
>![](https://upload-images.jianshu.io/upload_images/790890-bd1211bcee258623.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* Reveal是一个iOS程序界面调试工具，可以在Reveal上查看视图的层级和修改控件的属性，用来调试UI。
* Reveal允许开发者在不修改代码、不重新构建项目、不重新部署应用程序的情况下就能够调试iOS应用的用户界面。

#### Reveal 延长试用时间方法
* 对于官网下载的Reveal，默认给予的是14天左右的试用时间。
*  首先 https://revealapp.com/download/ 从官网下载reveal，并填写自己（未注册过）的邮箱。
>![](https://upload-images.jianshu.io/upload_images/790890-013c19f0f84678a7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 然后会收到一封邮件，包含试用的激活码。
>![](https://upload-images.jianshu.io/upload_images/790890-e39ce346df3ecf3d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 打开reveal 输入激活码即可。
* 试用到期后，把电脑时间调整到注册日期之时，然后再打开reveal即可恢复试用时间。

>  Reveal 功能演示与下载地址：https://revealapp.com/
#### FLEX 是什么
* Flipboard/ FLEX (Flipboard Explorer) 是 Flipboard 发布的应用内调试工具，开发者可在toolbar中查看和修改运行中的应用。

#### FLEX 安装方式
* 可通过pod方式：pod 'FLEX', '~> 2.0'

##### FLEX 功能包含以下功能：
1. 查看、实时修改view（与Reveal相关功能类似，视觉验证中非常有用）
![](https://upload-images.jianshu.io/upload_images/790890-269a6ea7078245b0.gif?imageMogr2/auto-orient/strip)

2. 监控网络请求记录（与Charles抓包功能类似）
![](https://upload-images.jianshu.io/upload_images/790890-4b7fae72c8d0782d.gif?imageMogr2/auto-orient/strip)

3. 沙盒内容查看（数据持久化内容）
![](https://upload-images.jianshu.io/upload_images/790890-87f1117538bd4b8a.gif?imageMogr2/auto-orient/strip)

4. 查看App中所有的类以及所用到的系统Framework。
![](https://upload-images.jianshu.io/upload_images/790890-c7a4fbc29f658586.gif?imageMogr2/auto-orient/strip)

5. 动态查看和修改NSUserDefaults值。
![](https://upload-images.jianshu.io/upload_images/790890-48afa5790785a773.gif?imageMogr2/auto-orient/strip)

6. 快速查看打印日志（来自NSLog）

7. 动态修改对象属性值。

8. 动态调用实例和类方法。

>FLEX官方地址：https://github.com/Flipboard/FLEX
---

### 2. 安装 MonkeyDev 和 Theos
######安装Theos
脚本地址：https://github.com/bigsen/Theos-Script
演示安装：
>![](https://upload-images.jianshu.io/upload_images/790890-b406dcb95d135b95.gif?imageMogr2/auto-orient/strip)
详细安装说明与步骤：https://www.jianshu.com/p/2d2c492a283c

######安装MonkeyDev
* MonkeyDev ，是越狱开发iOSOpenDev的升级，非越狱插件开发集成神器
* 官方文档：https://github.com/AloneMonkey/MonkeyDev/wiki
```
git clone https://github.com/AloneMonkey/MonkeyDev.git
cd MonkeyDev/bin
sudo ./md-install
```
---

### 3. ipa砸壳（两种方式得到脱壳后的ipa）
* 利用"dumpdecrypted"给ipa砸壳：https://www.jianshu.com/p/a4373b5feca0

* 一条命令砸壳 (详细菜鸟版) ：https://www.jianshu.com/p/6eb62eabb988

>还有一种办法：
通过越狱设备， 下载pp助手越狱版， 使用PP助手越狱版本对应APP到手机上。
.
然后使用ifunbox， 从/var/mobile/Containers/Bundle/Application 中找到，拷贝出来.app 包即可。
---

### 4. 集成 Reveal 和 FLEX
###### 到现在这一步我们已经有了：
* Reveal 工具
* FLEX 工具
* MonkeyDev 环境
* 脱壳后的IPA 文件

###### 然后我们就可以正式开始我们的集成工作:
（1）新建 MonkeyDev 工程。
>![](https://upload-images.jianshu.io/upload_images/790890-f3d44d297cf19d93.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>![](https://upload-images.jianshu.io/upload_images/790890-c3e20f5731a6a79d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


（2）替换 Reveal Framework 为自己电脑当前对应版本。
* 使用自己电脑的RevealServer.framework替换掉/opt/MonkeyDev/frameworks下面的RevealServer.framework。
```
sudo rm -f -r /opt/MonkeyDev/Frameworks/RevealServer.framework
sudo cp -f -r /Applications/Reveal.app/Contents/SharedSupport/iOS-Libraries/RevealServer.framework /opt/MonkeyDev/Frameworks/RevealServer.framework
```

（3）MonkeyDev 工程添加FLEX Pod依赖。
>![](https://upload-images.jianshu.io/upload_images/790890-8cad2e0337de11cc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 打开 MonkeyDev 工程中的 Podfile，在target ' XXX Dylib' do
里面填写pod 'FLEX', '~> 2.0'。

（4）注册监听，初始化FLEXManager。
* 导入头文件。
* 在CHConstructor里注册DidFinish监听，初始化FLEX。
* 然后运行即可。
>![](https://upload-images.jianshu.io/upload_images/790890-e0b3b2f8312236ad.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>某些APP会Crash，需要打开AntiAntiDebug.m，取消注释这句话。
rebind_symbols((struct rebinding[1]){{"sysctl", my_sysctl, (void*)&orig_sysctl}},1); 
---

### 5. 成果演示 - 抖音APP示例
>![](https://upload-images.jianshu.io/upload_images/790890-50399fcb959e99db.gif?imageMogr2/auto-orient/strip)

---
越狱后可以做很多事情，集成Reveal 和 Flex 只是其中小小的功能而已。

#### 文中MonkeyDev Demo地址
https://github.com/bigsen/CrackeApp

#### 参考文章
* [FLEX 官方](https://github.com/Flipboard/FLEX)
* [MonkeyDev 官方](https://github.com/AloneMonkey/MonkeyDev/wiki)

#### 参考书籍
* 《iOS逆向工程》
* 《iOS应用与逆向安全》
