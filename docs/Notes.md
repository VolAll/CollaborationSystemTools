# Записки при чтении ИТС

## Интересный параметр запуска 

https://its.1c.ru/db/v8320doc#bookmark:adm:TI000000502

`1cv8 ENTERPRISE  /DisplayUserNotificationList`

Показывает непрочитанные сообщения из системы взаимодействия и центра оповещений при старте клиентского приложения.

## Работа с Техническим журналом

Для сбора логов на клиенте и сервере нужно подложить в 1С [файл настроек](/docs/TechJournal/logcfg.xml) с расширенными настройками логирования и дождаться повторения проблемы, после чего прислать лог на dep07webdev@1c.ru или мне(https://t.me/enflout) в личные сообщения

## Проверка работы службы

Для проверки нужно зайти в браузере в страницу [http://localhost:8087/rs/health](http://localhost:8087/rs/health)

Должна вернутся строка 

```json
{"status":"UP","mainDbOk":true,"allShardsOk":true,"hazelcast":{"available":true,"members":["127.0.0.1:5701"]},"elasticsearchOk":true,"mediaClusterOk":false,"mediaServers":{},"pushOk":false}`
