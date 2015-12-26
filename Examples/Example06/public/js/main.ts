/// <reference path="../../../DefinitelyTyped/angularjs/angular.d.ts" />

var mainApp = angular.module("mainApp", ["ngRoute"]);
mainApp.config(function($routeProvider) {
	$routeProvider.
	when("/", {
		templateUrl: "default.html",
		controller: "DefaultCtrl"
	}).
	when("/name", {
		templateUrl: "name.html",
		controller: "NameCtrl"
	}).
	otherwise({
		redirectTo: "/"
	})
});

mainApp.controller("DefaultCtrl", ['$scope',
	function($scope) {

	}]
);

mainApp.controller("NameCtrl", ['$scope',
	function($scope) {

	}]
);
