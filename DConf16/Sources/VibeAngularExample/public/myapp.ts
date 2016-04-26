/// <reference path="../DefinitelyTyped/angularjs/angular.d.ts" />
/// <reference path="../DefinitelyTyped/angularjs/angular-route.d.ts" />

interface Weather {
	text : string,
	temperature : number
}

var mainApp = angular.module("myapp", ["ngRoute"]);
mainApp
	.controller("myappCtrl", MainCtrl)
	.config(function($routeProvider: angular.route.IRouteProvider) {
		$routeProvider.
		when("/", {
			templateUrl: "main.html",
			controller: MainCtrl,
			controllerAs: "ctrl"
		});
	});

interface MainScope extends ng.IScope {
	wetter: Weather
}

class MainCtrl {
	public static $inject = [
			'$scope',
			'$http'
	];

	constructor(private $scope: MainScope,
			private $http : ng.IHttpService) 
	{
		this.weather();
	}

	weather() : void {
		var s = '/weather';
		this.$http.get(s).success((data : Weather) => {
			this.$scope.wetter = data;
		});
	}
}
