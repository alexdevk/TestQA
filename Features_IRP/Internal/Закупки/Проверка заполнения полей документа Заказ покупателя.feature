﻿#language: ru

@tree

Функционал: Проверка заполнения полей документа Заказ покупателя

Как Тестировщик я хочу
проверить заполнение полей Партнер, Соглашение,
проверить блокировку поля Контрагент – в случае, если не выбран Партнер 
чтобы убедиться что пользователь не ошибется при вводе данных   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка заполнениея полей документа Заказ покупателя
	И я закрываю все окна клиентского приложения	
	* Открытие формы документа		
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
		Тогда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Когда открылось окно 'Заказ покупателя (создание)'
	* Заполнить поля
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '2'   | 'Клиент 2 (2 соглашения)' |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		Тогда открылось окно 'Соглашения'
		И в таблице "List" я перехожу к строке:
			| 'Вид'     | 'Вид взаиморасчетов' | 'Код' | 'Наименование'                                        |
			| 'Обычное' | 'По соглашениям'     | '3'   | 'Индивидуальное соглашение 2 (расчет по соглашениям)' |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю на кнопку с именем 'FormWrite'												
	* Проверка заполнения полей Партнер, Соглашение
		Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
		Тогда элемент формы с именем "Agreement" стал равен 'Индивидуальное соглашение 2 (расчет по соглашениям)'
		И я нажимаю на кнопку с именем 'FormPostAndClose'
		И я жду закрытия окна 'Заказ покупателя * от *' в течение 20 секунд
		Когда открылось окно 'Заказы покупателей'
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя * от *'
		И я нажимаю на гиперссылку с именем "DecorationGroupTitleCollapsedPicture"
		Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
		Тогда элемент формы с именем "Agreement" стал равен 'Индивидуальное соглашение 2 (расчет по соглашениям)'

Сценарий: Проверка доступности поля Контрагент
	И я закрываю все окна клиентского приложения	
	* Открытие формы документа		
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
		Тогда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Когда открылось окно 'Заказ покупателя (создание)'
	* Проверить доступность без заполненного поля Партнер
		Если элемент формы с именем "Partner" стал равен ''
		И элемент формы с именем "LegalName" не доступен
	* Заполнить партнера и проверить доступность		
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '2'   | 'Клиент 2 (2 соглашения)' |
		И в таблице "List" я выбираю текущую строку
		Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
		И элемент формы с именем "LegalName" доступен