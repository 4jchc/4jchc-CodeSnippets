
六、微信项目(ipad/iphone版本) ios7

1.创建项目，用git版控制
2.导入xmppframwork框架
3.导入APPICON 启动图片
4.简单的做下登录界面(iphone / ipad 适配)
5.实现登录
(a) 登录成功之后，来主界面
(b) 登录失败要提示

"当Openfire后台登录不了，然后客户端也登录了，但是服务器确实是开始状态，原因是mac版openfire不太稳定"

如果在公司开发中 使用的openfire是linux版

解决办法
删除Openfire 重新安装

"怎么删除"
step1:打开命令行，切换到 "xmpp ▸ 资源 ▸ 删除xmpp环境"目录
step2:执行命令 "sudo ./deleteOpenfire"

"【登录细节】"
》如果用户注销后，回来登陆界面，直接显示上次登录过的帐号
把用户数据保存沙盒
"什么情况下才需要把数据保存到沙盒，用户登录成功后"

启动程序的时候，再从沙盒获取数据

》用户登录成功后，如果关闭APP,重新起动程序，如果没有注销，直接来到主界面
1》记录下登录状态

》如果用户登录过，重新启动程序时候，自动登录到服务器


6.注册
》要提示
》注册成功后，回到上一个页面，上一个页面的用户label是显示注册的用户名
》提示，请重新输入密码进行登录

"为什么把所有的xmpp操作，eg。登录、注册、注销放在appDelegate里面？"
原因：因为跟服务器交互的类XMPPStream,这个类在整个程序运行过程中，只有要一个实例(对象)
所以:把xmppStream这个对象放在某一个地方，给其它所有的控制获取到（共享）


"打开XMPP日志"





7.实现主界面


8.获取个人信息(头像、电话、邮箱....)
获取个人信息 在xmpp里面，称为"电子名片信息"

》添加电子名片模块
》一般电子模块配合头像模块使用
》怎么从sqlite里获取个人信息
'使用电子名片模块的一个属性myvCardTemp'

》怎么更新个人信息
'使用电子名片模块的一个方法updateMyvCardTemp'


"如何Spark不能使用，安装资源里JavaForOSX2014-001.dmg文件就可以了"




"安装Subline xml格式化"
{ "keys": ["ctrl+shift+x"], "command": "tidy_xml" },
//command + shift+x
'[
{ "keys": ["ctrl+shift+x"], "command": "tidy_xml" },
{ "keys": ["ctrl+shift+j"], "command": "prettify_json" }
]





"【模块开发】"
xmpp里的开发基本上是基于模块开发
》电子名片模块
》头像模块
》自动连接模块


9.获取好友列表 添加添加好友 删除好
10.发送聊天消息
11.实现文件传输

ios7 通知要配置plis文件

'1 Required background modes voip
'2 _xmppStream.enableBackgroundingOnSocket = true


