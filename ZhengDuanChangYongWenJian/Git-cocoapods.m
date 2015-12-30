
1、升级Ruby环境
这个时候你可以在终端使用："  sudo gem update —system来进行升级


2、安装CocoaPods时我们要访问cocoapods.org，该网站可能被我们大天朝墙了，这样下载安装可能会是龟速，幸好我们可以用淘宝的Ruby镜像来访问该网站，方法如下：

1、gem sources --removehttps://rubygems.org/

2、gem sources -ahttp://ruby.taobao.org/

可以使用下面的命令(红色部分)查看是否更换镜像成功（如下图所示）：
"   gem sources -l

3、安装Cocoapods，在终端输入命令

"  sudo gem install cocoapods

4、使用search命令搜索类库名：

"  pod search AFNetworking

5、需要在工程中创建一个Podfile文件，

使用命令：

"  cd /Users/shiyunlei/Desktop/CocoapodsSample(进入工程目录，cd后面的是工程的路径)

"   touch Podfile（创建Podfile文件）

然后使用vim编辑Podfile文件，使用命令：

"   vim Podfile
进入如下界面
然后使用vim编辑Podfile文件，使用命令：

"   vim Podfile
进入如下界面



然后紧接着按键盘上的“i”键，变成如下状态，这个时候可以对Podfile文件进行编辑：

"  platform:ios, ‘7.0‘

"   pod ‘AFNetworking‘, ‘~> 2.3.1‘

在编辑完成后按“esc”，



在按“:”,这个时候输入wq,点击回车，保存并退出。




这个时候打开Podfile文件就会看到里面添加了刚才在终端输入的一行语句，如下图



然后在终端输入命令安装相应的第三方类库

"  pod install











    sudo gem install cocoapods
    pod setup











"  git reflog
"  git reset --hard HEAD~5
'  git reset --hard HEAD^ 回到上一个版本

"  git reset --hard commit-id:






#1.新建一个“本地仓库”
"   git init

#2.配置仓库
》告诉git你是谁
git config user.name lnj
》告诉git怎么联系你
git config user.email lnj@itcast.cn

》上面一种配置方式是一次性的配置， 会配置到被管理文件的。git文件夹下
》下面一种配置方式是一劳永逸的方式:
git config --global user.name lmj
git config --global user.email lmj@itcast.cn

#》如何学习git指令
>学习git指令和SVN指令的学习其实是一样的， 只不过展现的方式不太一样， git是通过使用指南的方式告诉我们某一个指令如何使用
>这个指南其实是一个不可编辑的vim
Q退出指南
按空格下一页
control + B 上一页
/需要搜索的内容 可以进行搜索


#git常规指令
》git status 查看文件状态
》git add 添加文件到“暂存区”
》git commit 文件名称   添加文件到”本地仓库“
注意：如果没有在commit后面加上 -m说明修改了什么， 会自动进入vim界面， 要求我们输入修改信息
按键盘上的 i 代表开始输入内容
输入完毕之后按 esc 然后按 ：wq
所以： 如果以后在终端中提交最好在后面加上-m
》注意： git中的add和SVN中的add不太一样， SVN中只需要add一次， 而git中每次新建或者修改之后都需要重新add

》1.为添加之前的颜色
红色 代表在”工作区“
》2.添加到暂存区之后的颜色
绿色 代码在”暂存区“


》注意： git默认没有简写指令
》注意： 一般情况下不建议自定义简写指令
》git中的简写称之为起别名

> 查看log
》git log 文件名
》注意： GIt中的版本号是一个”40位“的哈希值， 而SVN中的版本号是一个递增的整数
》已经提交
git reset —hard HEAD^ 返回上一个版本
其中—hard代表强制重置
git reset —hard 版本号（只需要写前7位）
》未提交
git checkout 文件名 回退到上一次提交的版本
git reset —hard HEAD  回退到上一次提交的版, 注意HEAD后面没有尖号^


c9ad690 HEAD@{0}: commit: main.c

7026f99 HEAD@{1}: commit: 输出结果

e950c89 HEAD@{2}: commit: 新增输入

c7bf91c HEAD@{3}: commit: 添加变量

cbd9e52 HEAD@{4}: commit: 删除print函数

45ea44d HEAD@{5}: commit: 添加了printf函数

0da06d8 HEAD@{6}: commit (initial): i



>git reflog  查看所有修改信息（所有版本）


》查看文件被修改的什么地方
】	》git diff 文件名
》如果显示绿色代表新增
》如果显示红色代表删除


#远程仓库
#SVN需要一个单独的服务器
#Git不需要： 文件中、U盘中、云上、github、OSChina...

#1.新建git远程仓库
#》git init —bare
#注意： 这个仓库仅仅是用于管理代码， 不参与开发

#2.项目经理初始化项目
》2.1先克隆一份空得仓库到本地
git clone /Users/apple/Desktop/working/公司远程仓库

》2.2忽略不需要加入版本控制器的文件以及文件夹
.gitignore
注意： 配置忽略文件只需要到github上搜索.gitignore拷贝别人写好的代码即可
配置.gitignore一定要在和.git隐藏文件夹同一级的目录下
》2.3生成好.gitignore文件之后， 还需要将.gitignore文件添加到版本控制
git add  .gitignore
git commit .gitignore -m””

》2.4新建项目
》 source conrol—>commit  将代码提交到本地仓库
》source conrol—>push 将代码提交到远程仓库


git中默认就会创建一个分支， 这个分支叫做origin/master， 相当于svn中的trunk


专业人员只需要在git仓库的hooks文件夹中写一些指令， 就可以完成自动测试（压力测试、自动测试、集成测试、冒烟测试、。。。）


》 和SVN一样， 如果服务器仓库的代码被修改了， 我们再提交代码也会报错。
fetch first == out of data

总结：
git和svn最大的区别
》1.git每次修改新增都需要add
》2.git每台电脑都有一个仓库
》3.git是先提交到本地仓库， 再提交到远程仓库




新人服务器搭建
1.新建一个新人服务器
2.初始化仓库
git init --bare
3.添加一个新的远程仓库
source control —> master —>config —>remotes —>add —> add remote
4.将经理最新的代码提交到新人服务器
5.经理分配新人服务器的地址给新人



GIT的分支管理
》在本地代码库给项目打上一个标签
git tag -a v1.0 -m 'Version 1.0’
》查看当前标签
git tag
注意： 此时此刻打上的这个标签仅仅是一个本地标签。（和服务器没有关系）
》将标签添推送到远程代码库中
git push origin v1.0


1.开发
2.发布
3.保存稳定版本
4.继续开发
5.出现bug
6.分配员工到分支上修复bug
>员工从服务器下载最新代码
》员工利用git checkout v1.0指令快速切换到1.0版本
》根据提示：开启一个新的分支开始修复代码
git checkout -b 1.0bug_fix

7.合并修复后的代码到主线
8.备份稳定版本




通过Xcode将代码提交到github上， 把仓库放在github上


=======================================================
》1.注册一个github账号
》2.配置SSH Keys， 只要配置了SSH Keys就可以和github无缝衔接

》点击昵称来到个人主页
》 点击主页中的设置（setting）
》 点击SSH Keys
》点击 generating SSH keys

》1.检查本地的ssh keys
在“用户目录”下 ls -al ~/.ssh
2.如果文件夹不存在需要手动创建一个
mkdir .ssh

3.根据github的提示2生成ssh keys
在.ssh目录下执行 ssh-keygen -t rsa -C "your_email@example.com”
输入完成之后连续按下回车， 知道出现牛逼的图形位置
4.生成完公钥和私钥之后输入
ls -la查看是否生成成功   id_rsa（私钥） id_rsa.pub(公钥)
5.根据提示3获得公钥
pbcopy < ~/.ssh/id_rsa.pub
6.点击 setting —》 ssh key —>add ssh key
将刚才获取到得公钥添加进去

7.更具github第4步提示， 验证公钥
验证成功网页上的灰色圆点会变成绿色

8.拷贝到公钥之后打开github主页
》点击仓库（Repositories）
》再点击new来到github创建仓库界面

9.通过github提供的地址下载一个空得仓库到本地
》创建一个新的项目到本地仓库文件夹中
》利用Xcode提交代码到github
》注意： 要求输入用户名密码时候， 输入的是github上显示的昵称而不是登录账号

=======================================================






现实生活：
运动场 == 物理仿真器
跑步 == 物理仿真行为
人 == 仿真元素

// 1.创建物理仿真器
// 2.创建物理仿真行为
// 3.将物理仿真行为添加到仿真器中
