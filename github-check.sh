#!/bin/bash

if [[ ! -e ./github-check.list ]]; then
	touch github-check.list
	if [[ ! $(tttjq --help) ]]; then
		echo -e "\e[33mДля проверки обновлений требуется команда 'jq'\nВыполняем установку...\e[0m\n"
#		urpmi jq
	fi
	echo -e "\e[33mЗаполните файл './github-check.list' адресами на проекты по примеру:\e[0m\n\e[34mnixscript/yabrowser-install-bash\nnixscript/cheat.sh_plus_trans\n...\e[0m\n"
	echo -e "\e[32mПолный адрес выглядит так: https://github.com/nixscript/yabrowser-install-bash\e[0m"
	echo -e "\e[33mВам необходимо указать подобный адрес, но без этого -> https://github.com/\nСкрипт автоматически сформирует нужный путь!\e[0m\n"
	exit 2
fi

checkList=$(cat ./github-check.list)
[ ! -e "./github-last-versions.list" ] || touch github-last-versions.list
newVersion=
versionLine=($(cat ./github-last-versions.list))
count=0
for line in $checkList; do
	echo "Проверка $line..."
	content=$(curl -s https://api.github.com/repos/$line/releases/latest)
	githubLastVersion=$(jq -r '.id' <<<"$content")
	if [ "${versionLine[$count]}" != "$githubLastVersion" ]; then
		echo -e "\e[34m$line\e[0m\e[37;1m < \e[0m\e[33m$githubLastVersion\e[0m \e[37mНовый релиз доступен!!!\e[0m"
		echo -e "\e[35;1mhttps://github.com/$line/releases\e[0m"
	else
		echo -e "\e[34m$line\e[0m\e[37;1m = \e[0m\e[32m$githubLastVersion\e[0m"
	fi
	newVersion="$newVersion $githubLastVersion"
	count=$((count + 1))
done
rm -rf ./github-last-versions.list
IFS=' '
for s in $newVersion; do echo "$s" >> ./github-last-versions.list; done
