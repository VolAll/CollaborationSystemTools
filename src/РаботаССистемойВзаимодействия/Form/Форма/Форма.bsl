﻿&НаКлиенте
Перем КодАктивации;

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ИмяИнформационнойБазы =  Метаданные.Синоним;
	Если ИмяИнформационнойБазы = "" Тогда
		ИмяИнформационнойБазы = Метаданные.КраткаяИнформация;
	КонецЕсли;

	Если НЕ СистемаВзаимодействия.ИнформационнаяБазаЗарегистрирована() Тогда
		// нужны права "АдминистрированиеДанных".
		ДвнныеРегистрации = СистемаВзаимодействия.ПолучитьДанныеРегистрацииИнформационнойБазы();
		ДоступнаПовторнаяРегистрация = ДвнныеРегистрации <> Неопределено;
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ОбновитьСтатус(Команда)
	// Вставить содержимое обработчика.
КонецПроцедуры

&НаКлиенте
Процедура Зарегистрировать(Команда)
	
	ПараметрыРегистрации = Новый ПараметрыРегистрацииИнформационнойБазыСистемыВзаимодействия();
	
	// путь локальный или wss://1cdialog.com:443 (1cDialog.com)
	ПараметрыРегистрации.АдресСервера 			= АдресСервера;
	
	ПараметрыРегистрации.АдресЭлектроннойПочты 	= ?(НоваяРегистрация = 0, "", АдресЭлектроннойПочты);
	
	// служит для того, чтобы указать представление регистрируемого приложения.
	ПараметрыРегистрации.ИмяИнформационнойБазы 	= ?(НоваяРегистрация = 0, "", ИмяИнформационнойБазы);
	
	ПараметрыРегистрации.КодАктивации 			= КодАктивации;
	
	ОписаниеОповещенияРегистрации = Новый ОписаниеОповещения("RegistrationSuccessHandler",
								  ЭтаФорма,
								  ,
								  "RegistrationErrorHandler",
								  ЭтаФорма);
	СистемаВзаимодействия.НачатьРегистрациюИнформационнойБазы(ОписаниеОповещенияРегистрации, ПараметрыРегистрации);
КонецПроцедуры
