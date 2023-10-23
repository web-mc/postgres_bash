Установка докера в режиме rootless и запуск контейнера с PostgreSQL 15-й версии.

Чтобы запустить выполняем:
```
bash veeneo_init_pg.sh -n db_name -u db_user -s db_pass -p db_port
```
**db_name** - Название aдля базы данных

**db_user** - Пользователь базы данных

**db_pass** - Пароль для входа

**db_port** - Порт. Стандартный порт для postgres это 5432, но можете указать свое значение.

**Важно:** название базы и имени пользователя не должны начинаться с "**pg_**".