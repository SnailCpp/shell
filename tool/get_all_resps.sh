#/usr/bin/bash
 
git_host="https://github.com"
tmp_log="tmp_repos.log"

function gitclone()
{
	username=$1
	echo "----------STARTING CLONE, USERNAME : $username ----------"
	curl $git_host/$username?tab=repositories > tmp.html
	cat tmp.html | grep  "codeRepository" | grep  -oE '(href=\")[^"]+(\")' | grep -oE '[^href="][^"]+' > tmp.txt
	while read line; do
	echo "Starting Get " $git_host$line
	if [ -d .$line ];then 
		echo ".$line allready exist, run fetch"
		cd .$line
		git fetch 
		cd ../..
	else
		mkdir -vp ~/.$line
		git clone $git_host$line .$line
	fi
	done < tmp.txt

	echo "----------END CLONE, USERNAME : $username----------"
}

function main()
{
	if [ $# = 0 ] ; then
		echo "Usage : $0 username ..."
	else
		for i in "$@"
		do
			gitclone $i
		done
	fi
}

main $@;
