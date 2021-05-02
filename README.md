# api_yamdb
## Описание
 Этот проект представляет из себя программный интерфейс сайта-отзовика yamdb,
 разработанного для того, чтобы люди делились своими впечатлениями о произведениях(книги, фильмы, музыка и т.д.)
 На данном сайте можно как и написать свой отзыв, так и прокомментировать чужой.
##Состояние workflow
![example workflow](https://github.com/RenkasVajra/yamdb_final/actions/workflows/yamdb_workflow.yml/badge.svg)
### Запуск проекта в dev-режиме
- Установите и активируйте виртуальное окружение
- Установите зависимости из файла requirements.txt
```
pip install -r requirements.txt
``` 
- В папке с файлом manage.py выполните команду:
```
python3 manage.py runserver
```
### Команды для запуска приложения
- Обычный запуск контейнера
```
docker run -it -p 8000:8000 yamdb
```
- Запустите docker-compose для совместной работы web- , nginx- и api- контейнеров
```
docker-compose up
```
- Если в какой-то из контейнеров были внесены изменения, нужно выполнить миграции, пересобрать и запустить его следующими командами
```
docker-compose exec web python manage.py migrate --noinput
docker-compose up -d --build
```
### Создание суперпользователя 
- Для того чтобы создать суперпользователя, выполните в консоли команду
```
docker-compose exec web python manage.py createsuperuser
```
### Заполнение БД начальными данными
Чтобы заполнить БД, нужно создать данные через админку Django, а затем выполнить команду
```
docker-compose exec web python manage.py dumpdata > fixtures.json
```