

"打开终端，按顺序输入以下命令：(注意细小的标点符号，建议逐一复制命令到终端运行)
'   sudo chmod -R 777 /usr/local/openfire/bin
'   sudo su
'   cd /usr/local/openfire/bin
'   export JAVA_HOME=`/usr/libexec/java_home`
'   echo $JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home
'   cd /usr/local/openfire/bin
'   ./openfire.sh


(删除openfire)
"首先,确保你已经关掉了openfire
"打开终端 (在应用程序-->实用工具-->)
//输入以下命令
'   sudo rm -rf /Library/PreferencePanes/Openfire.prefPane

'   sudo rm -rf /usr/local/openfire

'   sudo rm -rf /Library/LaunchDaemons/org.jivesoftware.openfire.plist

" Head search path   $(SDKROOT)/usr/include/libxml2
" Other Linker Flags  -lxml2
OC pch
Prefix Header






"******************** 设置mysql的root密码
打开终端，输入：
sudo vi ~/.bash_profile
输入 i
然后粘贴以下内容
# mysql
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
# ls
alias ls='ls -G'
按ESC键
输入 :wq
重新启动终端程序

在命令行中输入下面命令修改密码
mysqladmin -u root password "123456"
"******************** 设置mysql的root密码










"第一步1"""""""""""""""""""""""""""""""""""""""""""
"设置mysql命令"
// sudo vi ~/.bash_profile
// i
# mysql
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
# ls
alias ls='ls -G'
按ESC
输入 :wq

拷贝bin目录 '  /usr/local/mysql/bin

"第一步1"""""""""""""""""""""""""""""""""""""""""""







一、了解XMPP
协议(标准)
XMPP 即时通讯协议
SGIP 短信网关协议 这手机发短信

移动支付和网页支付

0x23232[0,1] 0x23232 0x23232 0x23232

只有协议，必须会有协议文档


二、环境配置
1.安装mysql
2.修改mysql的帐户的密码
》sqlite（移动平台） ，是没有密码直接连接数据库
》mysql sqlServer （服务端的数据库） 是有帐户和密码
  默认安装完mysql,他的帐户是root 密码为空

"第二步2"""""""""""""""""""""""""""""""""""""""""""
"使用命令登录mysql"
'mysql 用来登录
//  mysql -u root -p
"第二步2"""""""""""""""""""""""""""""""""""""""""""
'查询Mysql里的数据库
//  show databases;





"第三步3"""""""""""""""""""""""""""""""""""""""""""
'exit退出mysql
'mysqladmin 管理帐号
// mysqladmin -u root password "123456"
// "mysqladmin 修改root的密码 123456"

"第四步4"""""""""""""""""""""""""""""""""""""""""""
'3.安装openfire服务
》opnfire服务器是基于java语言写，也就意味着你的电脑有java运行环境
》怎么查看电脑有没有安装java的运行环境

'在终端使用 "
"  java -version
如果有信息显示，代表安装。
如果没有，怎么办？安装java运行环境 安装文件在"服务器/jdk-7u45-macosx-x64.dmg"

"第五步5"""""""""""""""""""""""""""""""""""""""""""
' 安装目录:  /usr/local/openfire/

4.配置Openfire
》要配置数据库(在mysql创建一个openfire数据库专门给openfire服务器)
》导入Openfire里数据库表脚本文件

》配置openfire的管理员密码



5.使用客户端登录Openfire的服务器
》系统的"信息" 帐户名称 ＝ 用户名 + @ +服务器名称：teacher.local

 "      zhangsan@teacher.local

 "      lisi@4jbook-pro.local
 "      zhangsan@4jbook-pro.local
 "      wangwu@4jbook-pro.local
"第五步5.1"""""""""""""""""""""""""""""""""""""""""""
》登录的时候，可以自己配置下域名
修改/ect/hosts;  4jbook-pro.local 127.0.0.1
'打终端，使用命令 "sudo vi /etc/hosts" 然后敲 i
"   127.0.0.1 4jbook-pro.local 退出 esc 键 : wq 退出
"   127.0.0.1 teacher.local 退出 esc 键 : wq 退出
"   ping -c 4 teacher.local 查看ip


6.学习xmmpframework的框架的目录结构
》当学习第三方框架的时候是怎么学习？
a> demo 示例程序
b> 文档
c> readMe


三、学习异步Socket框架GCDAsyncSokcet
1.昨天写个聊天室，用GCDAsyncSokcet 来实现聊天室


四、xmppframework框架的导入
💗💗
"第六步6"""""""""""""""""""""""""""""""""""""""""""

" Other Linker Flags -lxml2
" Header Search Paths = /use/include/libxml2
" 添加动态库  libxml2.tbd
" 添加动态库  libresolv.tbd



