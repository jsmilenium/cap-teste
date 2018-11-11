angular
  .module('app')
  .config(['$routeProvider', function ($routeProvider) {
      $routeProvider
          .when("/", {templateUrl: "app/course/course.html", controller: "CourseCtrl"})
          .when("/courseDetail", {templateUrl: "app/course/courseDetail.html", controller: "CourseDetailCtrl"})
          .otherwise("/");
  }]);
  