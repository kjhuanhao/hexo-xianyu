##!/bin/sh
#本脚本请在git bash中运行
# 作者：Huanhao
# 在终端输入 ./backup.sh 即可打开脚本
# 博客：https://laijiahao.cn/

#运行脚本前请更改下面的参数，且去掉注释
#github_backup="https://github.com/kjhuanhao/test"
#github_backup_ssh="git@github.com:kjhuanhao/test.git"

#部署hexo
function hexo_new()
{
echo "正在部署hexo环境！"
npm install hexo-cli -g
if [ $? -ne 0 ]; then
    echo -e "\033[31m 下载失败 \033[0m"
else
    echo -e "\033[32m恭喜你！hexo部署成功！\033[0m"
fi

}

#首次部署博客
function newblog()
{
mkdir blog 
cd blog
hexo init
npm install hexo-deployer-git --save
if [ $? -ne 0 ]; then
    echo -e "\033[31m 部署插件安装失败 \033[0m"
else
    echo -e "\033[32m成功安装部署插件！\033[0m"
fi
rm -rf .git
git init 
git remote add origin $github_backup_ssh
git add . 
git commit -m "first_update"
git push origin master --force 
echo -e "\033[32m初始化完成，执行hexo s进行预览！\033[0m"
cd ..
cp hexo.sh blog/
}

function up()
{
	hexo g -d 
if [ $? -ne 0 ]; then
    echo -e "\033[31m 上传失败！请检查你的配置文件！ \033[0m"
else
    echo -e "\033[32m上传成功！请刷新你的网页！\033[0m"
fi

}

#生成标签页、分类页、友链页，关于页且自动配置
function tcf()
{
	hexo new page "tags"
	hexo new page "categories"
	hexo new page "friends"
	hexo new page "about"
   echo -e "\033[32m标签页、分类页、友链页已为你自动生成！\033[0m"

}


#backup
function push()
{

echo -e "\033[32m正在为你备份博客中.........\033[0m"
git add .
echo -e "\033[32m正在为你备份博客中.........\033[0m"
git commit -m "update"
echo -e "\033[32m正在为你备份博客中.........\033[0m"
git push origin master --force
if [ $? -ne 0 ]; then
    echo -e "\033[31m 备份失败！请检查网络情况！ \033[0m"
else
    echo -e "\033[32m恭喜你！已为你备份到你的GitHub仓库 $github_backup \033[0m"
fi

}


function help()
{
	

	echo "======================= hexo-script menu ======================="
				printf "\033[36m脚本作者: https://laijiahao.cn/ "
				printf "你可以选择以下的参数:\n"
				printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 'hexo 进行部署hexo' ''
				printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 'newblog 博客初始化' ''
				printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 'push 进行备份博客' '' 
				printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 'tcf 生成四大基本页面' '' 
				printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 'help 查看帮助' '' 
				printf "\n"
				printf "\n"
				printf "请选择一个参数运行本脚本\n"
				printf "\n"
				printf "举例:\n"
				printf ">\033[36m./hexo.sh s\n\033[0m"
echo '----------------------------------------------------------------'
}

case $1 in
up)
up
;;
newblog)
newblog
;;
push)
push
;;
tcf)
tcf
;;
help)
help
;;
hexo_new)
hexo_new
		;;
		*)
		 ;;
esac