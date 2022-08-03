## 使用须知

设置别名使用更加方便，vim可用`:wq`保存

```bash
cd /etc/profile.d
vim aliases.sh
```

加入内容：`alias h='./hexo.sh' `

## 准备工作

1. 确保你已经安装如下依赖，且系统变量成功配置

- [git](https://git-scm.com/)
- [nodejs](https://nodejs.org/)

2. 修改脚本中的参数，分别为你的备份仓库地址和ssh链接

```
#运行脚本前请更改下面的参数，且去掉注释
github_backup="https://github.com/kjhuanhao/test" 
github_backup_ssh="git@github.com:kjhuanhao/test.git"
```

## 如何使用

你可以选择以下的参数:
  hexo 进行部署hexo
  newblog 博客初始化
  push 进行备份博客
  tcf 生成四大基本页面
  help 查看帮助


请选择一个参数运行本脚本

举例:
>./hexo.sh hexo