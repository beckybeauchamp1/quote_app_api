'use strict';

(function(){
  angular
  .module("quote")
  .directive("authNav", function($auth) {
    return {
      templateUrl: "js/users/_auth.html",
      restrict: 'E',
      link: function(scope) {
        // update scope/view on successful signin
        scope.$on('auth:login-success', function(ev, user) {
          scope.currentUser = user;
          console.log(scope.currentUser)
        });
        scope.$on('auth:logout-success', function(ev, user) {
          scope.currentUser = false;
        });
        scope.$on('auth:registration-email-success', function(ev, user) {
          console.log(user);
          console.log("Email")
          scope.currentUser = user;
          console.log(scope.currentUser)
        });

        // set initial state, for currentUser, when directive is loaded
        $auth.validateUser()
        .then(function(user){
          scope.currentUser = user;
          console.log(scope.currentUser)
        })
        .catch(function(err){
          scope.currentUser = undefined;
        });
      }
    };
  });
})();
