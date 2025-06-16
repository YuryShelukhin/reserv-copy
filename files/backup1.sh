#!/bin/bash

# исходная директория
SOURCE_DIR="/home/yury"
# целевая директория
TARGET_DIR="/tmp/backup"
# команда rsync. Cтандартный вывод - в /dev/null, ошибки - в лог
#rsync -ac --delete "$SOURCE_DIR" "$TARGET_DIR" > /dev/null 2>> /var/log/backup.log
rsync -ac --delete /home/yury /tmp/backup > /dev/null 2>> /var/log/backup.log

# проверка кода завершения rsync и запись лога
if [ $? -eq 0 ]; then
    echo "[$(date)] - резервное копирование успешно выполнено" >> /var/log/backup.log
else
    echo "[$(date)] - ошибка при выполнении резервного копирования" >> /var/log/backup.log
fi