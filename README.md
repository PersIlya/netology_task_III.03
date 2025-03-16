## <p style="text-align: center;">ОТЧЕТ</p> <p style="text-align: center;">по домашним заданиям к занятию «Использование Ansible»</p>
## <p style="text-align: right;">Выполнил: студент ___________.</p>

## Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.
2. Репозиторий LightHouse находится [по ссылке](https://github.com/VKCOM/lighthouse).

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.
2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.
3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.
4. Подготовьте свой inventory-файл `prod.yml`.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.


---

### <div style="text-align: center;">Решение</div>


>по пункту 3
![localImage](./screen_III.03.3.png) 

>по пункту 6
![localImage](./screen_III.03.6.png) 

# Ссылки на файлы:
>[site](./playbook/site.yml);   
>[inventory](./playbook/inventory/prod.yml);    
>[vars vector](./playbook/group_vars/vector/vars.yml);  
>[vars lighthouse](./playbook/group_vars/lighthouse/vars.yml);   
>[lighthouse.conf.j2](./playbook/templates/lighthouse.conf.j2);    
>[nginx.conf.j2](./playbook/templates/nginx.conf.j2);  

![localImage](./Yes.png)
