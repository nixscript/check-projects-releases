# check-projects-releases

[![Build Status](https://travis-ci.org/nixscript/check-projects-releases.svg?branch=master)](https://travis-ci.org/nixscript/check-projects-releases)
[![GitHub License](https://img.shields.io/github/license/nixscript/check-projects-releases.svg)](https://github.com/nixscript/check-projects-releases/blob/master/LICENSE.md)
[![GitHub Release](https://img.shields.io/github/release/nixscript/check-projects-releases.svg)](https://github.com/nixscript/check-projects-releases/releases)

Для проверки обновлений проектов по списку.

Результат проверки при наличии новых версий:

![Screenshot](https://nc.grigrus.ru/index.php/apps/files_sharing/ajax/publicpreview.php?x=1920&y=593&a=true&file=new_release.png&t=uJrwSoSlPKxqysK&scalingup=0)

Результат проверки при отсутствии новых версий:

![Screenshot](https://nc.grigrus.ru/index.php/apps/files_sharing/ajax/publicpreview.php?x=1920&y=593&a=true&file=no_release.png&t=OcMUfQIW1T2lymE&scalingup=0)

Заполните файл './github-check.list' адресами на проекты по примеру:
```
nixscript/yabrowser-install-bash
nixscript/cheat.sh_plus_trans
```
Полный адрес выглядит так:
```
https://github.com/nixscript/yabrowser-install-bash
```
Вам необходимо указать подобный адрес, но без этого -> https://github.com
Скрипт автоматически сформирует нужный путь!
