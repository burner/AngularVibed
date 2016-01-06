/// <reference path="../../../DefinitelyTyped/angularjs/angular.d.ts" />
/// <reference path="../../../DefinitelyTyped/angularjs/angular-route.d.ts" />

'use strict';

module todos {
export interface TodoScope extends ng.IScope {
	todos: TodoItem[];
	newTodo: string;
	ctrl: TodoCtrl;
}

export class TodoItem {
	constructor(
		public id: number,
		public title: string,
		public completed: boolean,
		public creationDate: string
	) { }
}

export class TodoCtrl {
	public todosArray: TodoItem[];	

	public static $inject = [
			'$scope',
			'$location'
	];

	// dependencies are injected via AngularJS $injector
	// controller's name is registered in Application.ts and specified 
	// from ng-controller attribute in index.html
	constructor(
		private $scope: TodoScope,
		private $location: angular.ILocationService
	) {
		this.todosArray = [];
		/*this.todosArray = [
			new TodoItem(0, "Test", false, "1970-1-1_00:00:00"),
			new TodoItem(1, "Test2", true, "1970-1-1_00:00:01")
		];*/
		ITodo.getTodoItems(
			(nTodos: TodoItem[]) => {
				this.assignNewTodos(nTodos);
			},
			function(error) {
				alert(error);
			}
		);

		$scope.todos = this.todosArray;
		$scope.ctrl = this;
	}

	private assignNewTodos(nTodos: TodoItem[]) {
		this.todosArray = nTodos;
	}

	addTodo(): void {
		var theNextTodo = this.$scope.newTodo;
		this.todosArray.push(new TodoItem(
			this.todosArray.length, theNextTodo, false, "1970-1-1_00:00:02"
		));
		this.$scope.newTodo = "";
	}

	removeItem(item: TodoItem): void {
		var idx: number = this.todosArray.indexOf(item);
		if(idx != -1) {
			this.todosArray.splice(idx, 1);
		}
	}
}
}
