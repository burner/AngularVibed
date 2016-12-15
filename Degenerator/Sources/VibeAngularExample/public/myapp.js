/// <reference path="../DefinitelyTyped/angularjs/angular.d.ts" />
/// <reference path="../DefinitelyTyped/angularjs/angular-route.d.ts" />
var mainApp = angular.module("myapp", ["ngRoute"]);
mainApp
    .controller("myappCtrl", MainCtrl)
    .config(function ($routeProvider) {
    $routeProvider.
        when("/", {
        templateUrl: "main.html",
        controller: MainCtrl,
        controllerAs: "ctrl"
    });
});
var MainCtrl = (function () {
    function MainCtrl($scope, $http) {
        this.$scope = $scope;
        this.$http = $http;
        this.weather();
    }
    MainCtrl.prototype.weather = function () {
        var _this = this;
        var s = '/weather';
        this.$http.get(s).success(function (data) {
            _this.$scope.weather = data;
        });
    };
    MainCtrl.$inject = ['$scope', '$http'];
    return MainCtrl;
}());
