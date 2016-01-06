/// <reference path="../../../DefinitelyTyped/angularjs/angular.d.ts" />
/// <reference path="../../../DefinitelyTyped/angularjs/angular-route.d.ts" />
/// <reference path="todocontroller.ts" />

var mainApp = angular.module("mainApp", ["ngRoute"]);
mainApp.config(function($routeProvider: angular.route.IRouteProvider): void {
	$routeProvider.
	when("/", {
		templateUrl: "default.html",
		controller: "DefaultCtrl"
	}).
	when("/name", {
		templateUrl: "name.html",
		controller: "NameCtrl"
	}).
	when("/todo", {
		templateUrl: "todo.html",
		controller: todos.TodoCtrl
	}).
	otherwise({
		redirectTo: "/"
	})
});

mainApp.controller("DefaultCtrl", ['$scope',
	function($scope: angular.IScope): void {

	}]
);

mainApp.controller("NameCtrl", ['$scope',
	function($scope: angular.IScope): void {

	}]
);
