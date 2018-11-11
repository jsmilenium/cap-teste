angular.module('app')
    .controller('CourseDetailCtrl', function ($scope, $http, Course) {
        var ctrl = $scope;

        $scope.goBack = function() {
            window.history.back();
        };

        ctrl.id = Course.getItem();
        $http.get("http://localhost:8000/api/v1/course/"+ctrl.id)
            .then(function successCallback(response){
                ctrl.course = response.data[0];
            }, function errorCallback(response){
                console.log("Unable to perform get request");
            });

   
});