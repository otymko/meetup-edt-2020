//////////////////////////////////////////////////////////
// Примеры только из реальных проектов. Только хардкор
//////////////////////////////////////////////////////////

Функция ЗагрузитьАналогиВРегистр_fs_АналогиНоменклатуры()
	
	ИмяФайла = "D:\Interface\SAPexchange\MasterData\KDRU_Instead_items.csv";
	
	Разделитель = ";";
	Файл = Новый ЧтениеТекста(ИмяФайла);
	ТЗ = Новый ТаблицаЗначений;
	
	КС = Новый КвалификаторыСтроки(25, ДопустимаяДлина.Переменная);
	Массив = Новый Массив;
	Массив.Добавить(Тип("Строка"));
	ОписаниеСтроки = Новый ОписаниеТипов(Массив, , КС);
	ТЗ.Колонки.Добавить("Артикул", ОписаниеСтроки);
	ТЗ.Колонки.Добавить("АртикулЗамены",  ОписаниеСтроки);
	Строка = Файл.ПрочитатьСтроку(); // заголовки
	Пока НЕ Строка = Неопределено Цикл
		Строка = Файл.ПрочитатьСтроку();
		Если СокрЛП(Строка) = "" Тогда
			Продолжить;
		КонецЕсли;
		Массив = СтроковыеФункцииКлиентСервер.РазложитьСтрокуВМассивПодстрок(Строка, ";");
		Если НЕ Массив.Количество() = 0 Тогда
			НовСтр = ТЗ.Добавить();
			НовСтр.Артикул		  = Массив[1];
			НовСтр.АртикулЗамены  = Массив[2];
		КонецЕсли;
	КонецЦикла;
	
	Файл.Закрыть();
	
	Для каждого СтрТЗ Из ТЗ Цикл
		ЗагрузитьАналогиСтарые(СтрТЗ.Артикул,СтрТЗ.АртикулЗамены);
		ЗагрузитьАналогиНовые(СтрТЗ.Артикул,СтрТЗ.АртикулЗамены);
	КонецЦикла; 
	
КонецФункции

//@skip-warning
Процедура ЗагрузитьАналогиСтарые(Артикул, АртикулЗамены)
	// заглушка для демонстрации
КонецПроцедуры

//@skip-warning
Процедура ЗагрузитьАналогиНовые(Артикул, АртикулЗамены)
	// заглушка для демонстрации
КонецПроцедуры