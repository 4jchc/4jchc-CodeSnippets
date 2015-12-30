

一、即时通讯
 服务器用什么 Openfire
 数据库用什么 MySql
 客户端用什么 XMPPFramework

二、登录、注销、注册


//日志自定义 NSLog

三、电子名片（vCard）(个人信息)
 •怎么获取个人信息
 •修改个人信息

 电子名片，它是一种机制？获取电子名片或者发送电子名片数据
 获取电子名片,使用XMPPFramework里面提供的"电子名片模块"

 怎么使用 “电子名片模块”
 >导入 "电子名片模块"的头文件
 >激活 "电子名片模块"

 电子名片模块 它内部实现什么功能？
 >发送请求从服务器获取 "电子名片(用户个人信息)"数据
  <iq type="get" to="lisi@teacher.local"><vCard xmlns="vcard-temp"/></iq>

 >接到服务器返回的 "电子名片" 数据后，把数据缓存到本地数据库

 •打开XMPP的日志
  1>XMPP/Core/XMPPLogging.h 67行
    XMPP_LOGGING_ENABLED 设置为1
  2>需要配置XMPP日志启动
    在didfinishlauching方法 [DDLog addLogger:[DDTTYLogger sharedInstance]];

"Openfire功能有很多是不符合开发需求
 对Openfire进行二次开发
 Openfire基于java开发，每开一个功能模块，最终打包成一个插件(.jar)

四、花名册(好友列表)
 •怎么获取好友列表
  xmpp框架提供 "花名册模块"
  >发送请求，从服务器获取好友列表
  >把好友数据保存到本地

  "花名册数据库里的好友，如果使用新用户登录，会把以前登录用户的好友删除掉"

 •好友头像的显示

 •怎么删除，添加好友


五、聊天(时时)
  XMPP框架提供"消息模块"
  >接到好友的聊天数据后，把数据保存在数据库
 /*
   <message xmlns="jabber:client" id="fuzC7-36" to="lisi@teacher.local" from="wangwu@teacher.local/Spark 2.6.3" type="chat"><body>asdfasdfasd</body><thread>xQ4229</thread><x xmlns="jabber:x:event"><offline/><composing/></x></message>
  */

 •实现纯文字发送


 •发文件:
  图片
  语音，
  文档

eg.图片
方案1：
<message type="chat"  from="" to="wangwu@teacher.local">
 <body>12341234</body>
 <attachment>文件内容 "转成" 字符串</attachment>
</message>

//text 纯文本
//image 图片
//sound 音频
//doc word文件
//xls excel表格
 <message type="chat" to="wangwu@teacher.local" bodyType="image">
    <body>image</body>
    <attachment>xxxx</attachment>
 </message>

方案2：
<message type="chat" to="wangwu@teacher.local" bodyType="image">
<body>http://ww.baidu.com/xxcxc</body>
</message>


解析XML

自动断线连接

工作过程，认真看错误(english)
认真看需求

100 2\3即时通讯项目

//删除所有xmpp环境
sudo ./deleteAll

XMMP，QQ问我在，直接EMAIL过来





