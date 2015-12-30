

RVM 安装

' curl -L get.rvm.io | bash -s stable
' source ~/.bashrc
' source ~/.bash_profile
'修改 RVM 的 Ruby 安装源到国内的 淘宝镜像服务器，这样能提高安装速度

' sed -i -e 's/ftp\.ruby-lang\.org\/pub\/ruby/ruby\.taobao\.org\/mirrors\/ruby/g' ~/.rvm/config/db

"步骤0 － 安装系统需要的包



　　# For Mac

"步骤1 － 安装 RVM



RVM 是干什么的这里就不解释了，后面你将会慢慢搞明白。

　　'　　  curl -L https://get.rvm.io | bash -s stable
期间可能会问你sudo管理员密码，以及自动通过homebrew安装依赖包，等待一段时间后就可以成功安装好 RVM。

然后，载入 RVM 环境（新开 Termal 就不用这么做了，会自动重新载入的）

　　'　　  source ~/.rvm/scripts/rvm
检查一下是否安装正确

　　'　   rvm -v
"步骤2 － 用 RVM 安装 Ruby 环境



列出已知的ruby版本

　　'　  rvm list known



可以选择现有的rvm版本来进行安装（下面以rvm 2.0.0版本的安装为例）



　　'　　  rvm install 2.0.0
同样继续等待漫长的下载，编译过程，完成以后，Ruby, Ruby Gems 就安装好了。

另附：

查询已经安装的ruby

　　'  rvm list

卸载一个已安装版本

'     rvm remove 1.9.2

"步骤3 － 设置 Ruby 版本



RVM 装好以后，需要执行下面的命令将指定版本的 Ruby 设置为系统默认版本

　　　"　  rvm 2.0.0 --default
同样，也可以用其他版本号，前提是你有用 rvm install 安装过那个版本

这个时候你可以测试是否正确

　　"　　  ruby -v
　　"　　ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin13.0.0]

　　"　　  gem -v
　　　　2.1.6

这有可能是因为Ruby的默认源使用的是cocoapods.org，国内访问这个网址有时候会有问题，网上的一种解决方案是将远替换成淘宝的，替换方式如下：
　　"    gem source -r https://rubygems.org/
　　"　　  gem source -a https://ruby.taobao.org
要想验证是否替换成功了，可以执行：

　　"　　  gem sources -l

正常的输出结果：

　　　　　　CURRENT SOURCES

　　　　　　http://ruby.taobao.org/

到这里就已经把Ruby环境成功的安装到了Mac OS X上，接下来就可以进行相应的开发使用了。
