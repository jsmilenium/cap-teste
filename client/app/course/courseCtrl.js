angular.module('app')
    .controller('CourseCtrl', function ($scope, $http, $location, Course) {
    var ctrl = $scope;
    ctrl.title = 'Cursos';

    $http.get("http://localhost:8000/api/v1/course")
            .then(function successCallback(response){
                ctrl.courses = response.data;
            }, function errorCallback(response){
                console.log("Unable to perform get request");
            });

    ctrl.courseDetailCard = function(id) {
        Course.setItem(id);
        $location.path( "/courseDetail" );
    };

   
});