

    ruby --version

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    Homebrew使用

    Homebrew使用没啥好说的了，常用的

    '搜索软件：brew search 软件名，如brew search wget

    '安装软件：brew install 软件名，如brew install wget

    '卸载软件：brew remove 软件名，如brew remove wget




    之前一直使用FastestTube来下载Youtube视频，昨天朋友介绍Youtube-dl这个工具，发现下载速度更稳定更快。而且之前遇到1080P甚至4K的视频，视音频是分离的，FastestTube也只能分开下载，Youtube-dl可以完美解决这个问题。
    安装：打开终端，输入

'    sudo curl https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl

'    sudo chmod a+x /usr/local/bin/youtube-dl

    复制代码
    或者

'    sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
'    sudo chmod a+x /usr/local/bin/youtube-dl

    复制代码
    或者用Homebrew安装
'    brew install youtube-dl

    复制代码
    或者用pip安装

'    sudo pip install youtube-dl
    复制代码

    安装完毕以后我们就可以使用youtube-dl 命令来下载Youtube视频了，比如

    youtube-dl  视频地址
    复制代码
    使用代.理的方法  https://www.youtube.com/watch?v=MsyECGbviFQ

'    youtube-dl --proxy localhost:12345  视频地址

    youtube-dl --proxy localhost:12345  视频地址

    youtube-dl --list-formats https://www.youtube.com/watch?v=hLQl3WQQoQ0

        https://www.youtube.com/watch?v=4sks5NPz-34

--proxy xxx

" youtube-dl --list-extractors  #查看支持网站列表
" youtube-dl -U  #程序升级
" youtube-dl -h  #更多参数

youtube-dl --verbose https://www.youtube.com/watch?v=4sks5NPz-34



"    -f + 编号：通过上一步获取到了所有视频格式的清单，最左边一列就是编号对应着不同的格式，例如我想下载22号那个mp4格式分辨率为1280*720的视频，则按下面的命令就可以轻松指定下载视频哦；
    youtube-dl -f 22 http://www.youtube.com/watch?v=BlXaGWbFVKY

"下载youtube字幕及视频

"有的youtube视频是有字幕的可供下载的，但不是全部；如果过你想要下载字幕用这个脚本来操作也是很容易的；
先来说说两个参数–write-sub：加入字幕文件 –all-subs：如果有字幕存在则全部下载

    youtube-dl --write-sub --all-subs https://www.youtube.com/watch?v=0TjgZbVdOLA

"下载全部格式

youtube-dl  --all-formats https://www.youtube.com/watch?v=hLQl3WQQoQ0
–all-formats ：添加这个参数之后，所有存在的格式一扫而尽，统统下载；

