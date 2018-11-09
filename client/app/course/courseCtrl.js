/*angular.module('app')
    .controller('CourseCtrl', function ($scope, $http, $filter) {
        //console.log("Controller reporting for duty.");
        var ctrl = $scope;
        ctrl.title = 'Cursos';

        ctrl.search = null;
        ctrl.showPreSearchBar = function() {
            return ctrl.search == null;
        };
        ctrl.initiateSearch = function() {
            ctrl.search = '';
        };
        ctrl.showSearchBar = function() {
            return ctrl.search != null
        };
        ctrl.endSearch = function() {
            return ctrl.search = null;
        };
        ctrl.submit = function() {
            console.error('Search function not yet implemented');
        }

        // to focus on input element after it appears
        ctrl.$watch(function() {
            return document.querySelector('#search-bar:not(.ng-hide)');        
        });

        $http.get("http://localhost:8000/api/v1/course")
                .then(function successCallback(response){
                    ctrl.courses = response.data;
                }, function errorCallback(response){
                    console.log("Unable to perform get request");
                });

   
  });*/