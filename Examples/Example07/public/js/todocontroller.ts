/// <reference path="../../../DefinitelyTyped/angularjs/angular.d.ts" />
/// <reference path="../../../DefinitelyTyped/angularjs/angular-route.d.ts" />

'use strict';

module todos {
export interface TodoScope extends ng.IScope {
	todos: TodoItem[]
}

export class TodoItem {
	constructor(
		public title: string,
		public completed: boolean
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
		this.todosArray = [
			new TodoItem("Test", false),
			new TodoItem("Test2", true)
		];

		$scope.todos = this.todosArray;
	}
}
}
