За основу взят пример из официального сайта RiotJS.
В riot.mount в файле index.html добавлен элемент showMode: 'all', а в todo.tag три функции, меняющие этот элемент(режим просмотра) при нажатии на соответствующую кнопку фильтра.

	showAll(e) {
	  opts.showMode = 'all'
	  e.preventDefault()
	}
	
	showOnlyDone(e) {
	  opts.showMode = 'onlyDone'
	  e.preventDefault()
	}
	
	showOnlyUndone(e) {
	  opts.showMode = 'onlyUndone'
	  e.preventDefault()
	}
Функция WhatShow перед возвращением true/false (показать/не показывать) проверяет, в каком сейчас режиме просмотра находится приложение.