const app = angular.module('app', [
    'ngRoute',
    'ngAnimate',
    'ngAria',
    'ngMessages',
    'ngMaterial',
]);

/**
 * Configure the Routes
 */
'use strict';

app.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when("/", {templateUrl: "app/course/course.html", controller: "CourseCtrl"})
        .when("/courseDetail", {templateUrl: "app/course/courseDetail.html", controller: "CourseDetailCtrl"})
        .otherwise("/");
}]);

app.controller('CourseCtrl', function ($scope, $http, $location, CourseDetail) {
    var ctrl = $scope;
    ctrl.title = 'Cursos';

    $http.get("http://localhost:8000/api/v1/course")
            .then(function successCallback(response){
                ctrl.courses = response.data;
            }, function errorCallback(response){
                console.log("Unable to perform get request");
            });

    ctrl.courseDetailCard = function(id) {
        CourseDetail.setItem(id);
        $location.path( "/courseDetail" );
    };

   
});

app.service('CourseDetail', function () {
    var CourseId = '';

    return {
        getItem: function () {
            return CourseId;
        },
        setItem: function(value) {
            CourseId = value;
        }
    };
});

app.controller('CourseDetailCtrl', function ($scope, $http, CourseDetail) {
    var ctrl = $scope;

    $scope.goBack = function() {
        window.history.back();
      };

    ctrl.id = CourseDetail.getItem();
    $http.get("http://localhost:8000/api/v1/course/"+ctrl.id)
            .then(function successCallback(response){
                ctrl.course = response.data[0];
            }, function errorCallback(response){
                console.log("Unable to perform get request");
            });

   
});

/*app.config(function($mdThemingProvider) {
    $mdThemingProvider.theme('dark-grey').backgroundPalette('grey').dark();
    $mdThemingProvider.theme('dark-orange').backgroundPalette('orange').dark();
    $mdThemingProvider.theme('dark-purple').backgroundPalette('deep-purple').dark();
    $mdThemingProvider.theme('dark-blue').backgroundPalette('blue').dark();
});*/