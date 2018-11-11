angular.module('app')
    .service('Course', function () {
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