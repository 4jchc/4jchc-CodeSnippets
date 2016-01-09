
//前言：仿weixin实现一个即时通讯的案例，支持版本7.0以上

"准备工作 创建项目时使用git"
/*
显示隐藏文件，看到git的文件夹
defaults write com.apple.finder AppleShowAllFiles Yes && killall Finder
defaults write com.apple.finder AppleShowAllFiles No && killall Finder


设置git的(全局)用户与邮箱
git config --global user.name Fung
git config --global user.email fung@qq.com
*/


/**
 掌握的知识点
 1.配置应用程序的iPad与iPhone的各个设备的AppIcon
 
 2.配置应用程序的iPad与iPhone的各个设备的启动图片(LaunchImage)
 */

一、设置AppIcon与LaunchImage
1> 设置iPhone-iOS8.0/iOS7.0 iPad-iOS7.0的AppIcon
2> 设置LaunchImage时，
   a> Xcode6在TARGETS中去除Launch Sreen File里的值
   b> 在Lauch Images Source中添加在assests中的启动图片
   c> iPhone横屏与iPad横屏的启动图片不设置
   d> iPad1024x768图片不设置
   "因为微信资源包没有找到对应尺寸的图片,说明有些启动图片可以不用设置"
   "微信iPad运行，如果是横屏启动时，是没有显示图片的"

二、实现登录排版
1> 创建一个Login.storyboard,使用导航控制器包装登录控制器
2> 自定义导航控制器，设置导航条背景与状态栏样式
3> 添加登录框容器，使用AutoLayout，固定大小，顶点间距，水平居中
4> 使用Images.xcassets对登录按钮的背景图片进行slicing(切片操作)
5> 设置密码的文本输入框样式
*设置borderStyle = UITextBorderStyleNone;"storyboard设置，提醒为什么不能设置高度"
*设置textFiled的高度42

*设置backgroudImage为拉伸后的图片"代码实现，因为背景图片放在xcassets时，xcode会崩溃"

*设置密码文件框左边的图片
 设置图片控制的尺寸、图片内容模式
 设置文本框的leftViewMode为总是显示(UITextFieldViewModeAlways)"否则不显示左边的view"

5> 对控制器view进行拖拽手势监听实现上，实现登录输入框的上下滑动及反弹

"注：提交git版-微信目录结构分层+登录界面排版"


三、注册界面排版
1> 添加一个注册框容器，设置顶部，左边，右边距离固定，高度固定
2> 添加手机与密码文本输入框、注册按钮，并设置背影图片，文字居中显示
3> 设置按钮的可用状态
"注"
4> 判断当前设置是否为iphone,如果为iphone，注册框容器的左右两边间距为10
//[UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone
5> 设置导航条Item的样式-白色字体


四、实现其它登录排版
0>在登录界面的底部添加 "其它方式登录>"按钮
1> 将"注册界面"的视图拷贝到新的控制器
2> 去除横屏，这样在ipad上可以旋转，iphone上不可以

五、完成主界面排版[MainStoryboard]
1> 微信、通讯录、发现、我[拖四个导航控制器到Tabbar控制器]
2> 设置tabbarBtn的背景及文字，及导航栏的背景
 微信 tabbar_mainframe/tabbar_mainframeHL
 通讯录 tabbar_contacts/tabbar_contactsHL
 发现 tabbar_discover/tabbar_discoverHL
 我 tabbar_me/tabbar_meHL
"注：选设置普通状态的图片与文件，有时间再自定义tabbar"
3> 设置全局的状态栏样式
*在info.plist中添加View controller-based status bar appearance＝NO
*在自定导航控制器是设置[UIApplication shareApplication].statusBarStyle = UIStatusBarStyleLightContent
*设置导航栏标题 字体为粗体18/颜色为白色，
iOS7或者iOS以上使用NSFontAttributeName/NSForegroundColorAttributeName属性
iOS7以下UITextAttributeFont/UITextAttributeColor



02 "***********************************************************************************
02 "***********************************************************************************
02 "***********************************************************************************
02 "***********************************************************************************

//前言：仿weixin实现一个即时通讯的案例，支持版本7.0以上
/*
 日志 git log
 恢复指定版本 git reset --hard 版本号
 查看指令使用记录 git reflog
 */

"未完成"
/*
 * 前题：备置mysql密码时参照 "资源/MySql命令行/设置mysql的root密码"
 */
六、使用xmpp框架实现登录功能
1> 导入框架
a> 导入CocoaLumberjack 日志框架 "无须依赖"
b> 导入CocoaAsyncSocket 底层网络框架，实现异步socket网络通讯
"依赖:CFNetwork&Security框架"
c> 导入KisssXML XML解析框架
依赖libxml2.dylib
"还需要配置编译选项""
"Other Linker Flags = -lxml2"
"Header Search Path = /usr/include/libxml2"
e> libidn 直接导入
f> 导入下面四个文件夹
Authentication
Categories
Core
Utilities
"依赖libresolv.dylib"
g> 添加Extensions
h> 将Sample_XMPPFramework.h导入，并将其改名为XMPPFramework.h
"注在xcode6中系统有的Framework可以不用添加，但是dylib一定要添加"


2> 实现登录
*> 选分析登录的步骤
*> 初始化xmppStream核心类，并添加代理为全局队列dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
*> 连接服务器时，设置主机，端口与登录账号[先写死代码]
*> 在"代理中连接成功"时发送密码[先写死代码]
*> 在"代理中授权成功"时, 打印
*> 在"代理中授权失败"时, 打印
*> 在"代理中授权成功"时,通知用户上线
*> 官方把登录数据放在沙盒里 "我们放在单例对象"
*> 登录成功用block的方式通知 "其它方式登录控制器"
*> 在其它方式登录控制器中，用MBProgessHUB 显示进度，"在IPad中显示一定要用toView的显示方法,因为窗口没有横竖屏的概念，只有控制器的view才有横竖屏的概念"
*> 隐藏HUB时，引出block是在子线程调用的，不能直接刷新UI
*> 接收block的成功登录时，切换到主界面，"在切换到主界面前，要清除当前模态窗口" 强调自己写的block引用控制器时，要用__weak



七、使用xmpp框架实现注册功能
*> 先分析注册的步骤，与登录形成一个对比
*> 在AppDelegate中添加用户注册的方法
*> 在AppDelegate中添加一个userRegister的属性
*> "连接服务器，连接成功后判断userRegister在代理中做登录还是注册的操作"
*> 在代理中监听注册成功还是失败，再以block的方式通知"注册控制器"
*> "注册控制器" 再以 "代理的方式" 通知 "登录控制器"，并设置label的注册后的帐号
*> 抽取 "其它登录控制器" 登录的代码 到一个父类，实现登录


八、细节
0> 用户注销[断开连接，回到登录界面]
*> 通知用户下线、断开连接、显示登录界面

1> 用户登录过，未注销，不管是程序在后台还是重新启动，直接来到主界面
2> 用户登录过，未注销，退出台后时与服务器断开连接，获取焦点时获取自动
"在UserInfo单例中添加一个login属性来记录登录状态"
3> 登录界面设置上次登录的帐号

九、自动登录提示
0> 分析自动登录监听中的情况
/*
 1.开始连接服务器
 2.连接失败
 3.登录成功
 4.登录失败
 */

1> 在历史控制器中添加通知监听
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(autoLoginStatus:) name:WXAutoLoginStatusNotification object:nil];
2> 在APPDelegate中发送通知

3> "自动登录时延迟两秒登录，好演示效果，连接的主机用域名比较慢"

4> 转圈圈指示器是否转还是停止，应该放在主线程中


十、socket后台支持
/*
 * 注 iOS8不用写支持也可以后台支持
 * iOS7 和 iOS8 下都要演示
 */
1> "Required background modes"的key，值设置为voip，来指定类型
2> xmppStream.enableBackgroundingOnSocket = YES
3> xmpp代理接收到消息时，如果不在前台实现本地通知
[UIApplication sharedApplication] applicationState] != UIApplicationStateActive
设置本地通知的内容(用户名\n内容前多少个字) 声音(default)

4> 在iOS8要注册通知类型registerUserNotificationSettings




03 "***********************************************************************************
03 "***********************************************************************************
03 "***********************************************************************************


//模块

一、自动连接模块
1> 当用户网络不稳定时，如果断线，自动连接
2> 打开自动连接模块在xmppframework.h文件中打开XMPPReconncet
3> 在设置xmppStream时，开始自动连接并"激活"
4> "引用官方示例程序的teardown方法" 释放资源


二、电子名片模块与头像模块
0> "查看电子名片的模型文件,数据结构"
0> 什么是电子名片模块/头像模块
1> 在xmppframework.h中打开电子名片模块/头像模块的头文件
2> 在设置xmppStream中，设置电子名片模块/头像模块并激活，
"获取用户的个人信息，里面是不是有头像，也一并获取"
3> 在teardownxmppStream做相应的资源释放
4> 在 "Me"中打印 doc,不要使用SimPhodlers
5> 在document看CoreData生成的数据库,用SQLiteManager查看
6> 在"我" 中添加静态单元格，显示图片与账号
/*
 》XMPPvCardTemp *myvCard = xmppDelegate.vCardModule.myvCardTemp;
 》warning 看PPT,查看有些数据是没有解析的
 》取消头像，显示日志，使用XMLJSON格式化工具格式化，解释电子名片的电话未解析
 */

三、电子名片详细页面进行设置
0> 进入详细页面进行静态表格的排版
1> 绑定数据
2> 如果识别不同类型cell的点击，设置每个cell的tag不同
3> 点击cell，取消选择中、进行头相选择
4> "编辑信息界面，传一个cell到编辑控制控制器，在调用代理时时调用
[self.profileCell layoutSubviews];//重新刷新cell就会显示detailTextLabel,因为没文件，默认是不会创建label"
5> 保存数据


四、获取好友列表(花名册)
0> "查看花名册的模型文件,数据结构"
0> 在xmppframework中打开花名册模块
1> setupXmppStream中添加花名册模块
2> teardown中释放花名删模块
3> 在联系人控制串获取好友列表
/**
 * 获取好友列表时，一定要添加过滤条件?，因为多人登录，可能用同一个数据库?
 * 答案不会，演示数据，每次登录会清除以前的好友，做得不够好，实际开发自己创建数据库来管理
 */
4> "使用CoreData的普通方式获取好友列表"
5> 使用NSFetchedResultsController 获取好友列表
6> "在cell中演示sectionNum的在线状态，然后在排序中多添加个sectionNum的升序",从而演示出NSFetchedResultsController的作用

7> 获取头像 自定联系人Cell
if (friend.photo) {
    cell.imageView.image = friend.photo;
}else{
    NSData *data = [xmppDelegate.vCardAvatarModule photoDataForJID:friend.jid];
    if (data) {
        cell.imageView.image = [UIImage imageWithData:data];
    }else{
        cell.imageView.image = [UIImage imageNamed:@"login_defaultAvatar"];
    }
}

五、添加好友+删除好友
0> TextField左边的图片放在分类里
0> 是否添加为手机号友
/**注:写在分类UITextField里
 NSString *telRegex = @"^1[3578]\\d{9}$";
 NSPredicate *prediate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegex];
 return [prediate evaluateWithObject:self.text];
 */

1> 不能添加自己为好友
2> 添加的好友已经存在
[xmppDelegate.rosterStorage userExistsWithJID:friendJid xmppStream:xmppDelegate.xmppStream]
[xmppDelegate.roster subscribePresenceToUser:friendJid];

3> 删除好友
[xmppDelegate.roster removeUser:friend.jid]


六、聊天界面排版
0> 使用VFL排行聊天表格与输入框
tableViewHConst "H:|-0-[tableView]-0-|"
inputViewHConst "H:|-0-[inputView]-0-|"
vConst "V:|-0-[tableView]-0-[inputView(50)]-0-|"

1> 键盘监听，判断iphone还是ipad 再判断ipad的是横屏还是竖屏
UIInterfaceOrientationIsPortrait(self.interfaceOrientation)
#define iSiPhoneDevice ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
"重点"
2> 返回按钮监听
*> 设置textfiel的代理 实现textViewDidChange
*> 判断是否有换行符 "\n"
*> 有就去除掉首尾的空白字符和换行字符
[textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //

七、获取聊天消息+发送聊天消息
"聊天消息模块：什么是聊天消息模块，xmpp帮我们做数据存储 查看0135模块的数据结构"
0> xmppframework.h中打开消息归档模块与消息数据存储
1> 在setupXmppStream中消息归档模块与消息数据存储
2> 在teardown中释放消息归档模块与消息数据存储
3> 在通讯录控制器传递好友jid到聊天控制器
4> 从数据库加载聊天数据，一次性加载全部"使用NSFecthResultsController"
"强调：查询时要带条件，一定要属于当前登录用户与好友的聊天记录"
5> 发送消息
XMPPMessage *message = [XMPPMessage messageWithType:@"chat" to:self.friendJid];
[message addBody:msg];
[xmppDelegate.xmppStream sendElement:message];

6> 聊天数据滚动到底部
7> 讲解怎么判断自己发送的消息还是别人发的消息

八、实现输入框随文字的伸缩

九、实现图片的发送级语音发送的原理
#pragma mark 发送图片
-(void)sendImage:(UIImage *)image{
    XMPPMessage *msg = [XMPPMessage messageWithType:@"chat" to:self.friendJid];
    NSData *data = UIImagePNGRepresentation(image);
    [msg addBody:@"image"];
    XMPPElement *attachment = [XMPPElement elementWithName:@"attachment" stringValue:[data base64EncodedStringWithOptions:0]];
    [msg addChild:attachment];
    
    [[WXXMPPTools sharedWXXMPPTools].xmppStream sendElement:msg];
}

#parm mark cell显示
XMPPMessage *xmppMsg = msg.message;
chatCell.imageView.image = nil;
if ([msg.body isEqual:@"image"]) {
    NSArray *child = xmppMsg.children;
    for (XMPPElement *node in child) {
        if([[node name] isEqualToString:@"attachment"]){
            NSString *base64 = [node stringValue];
            NSData *imageData = [[NSData alloc] initWithBase64EncodedString:base64 options:0];
            chatCell.imageView.image = [UIImage imageWithData:imageData];
        }
        
    }
    
}

第二种
[message addAttributeWithName:@"bodyType" stringValue:@"image"];
[xmppMsg attributeStringValueForName:@"bodyType"]



邮箱解析
NSArray *emailEles = [self elementsForName:@"EMAIL"];
if (emailEles.count != 0) {
    NSXMLElement *email = emailEles[0];
    NSXMLElement *userID = [email elementForName:@"USERID"];
    return @[[userID stringValue]];
}

NSArray *emailEles = [self elementsForName:@"EMAIL"];
if (emailEles.count != 0 && emails.count!=0) {
    NSXMLElement *email = emailEles[0];
    NSXMLElement *userID = [NSXMLElement elementWithName:@"USERID" stringValue:emails[0] ];
    [email removeElementForName:@"USERID"];
    [email addChild:userID];
}





