(function(){
  angular
  .module("quote")
  .controller("SessionsController", function($auth, $state, $scope){
    console.log("ksndfasjknf")
    this.signinForm = {};
    this.signin = function() {
      $auth.submitLogin(this.signinForm)
      .then(function(resp) {
        $state.go('quoteIndex');
        console.log("Sucess Login");
      })
      .catch(function(resp) {
        console.log("Signin failure:", resp);
      });
    };

    this.signup = function() {
      $auth.submitRegistration(this.signupForm)
      .then(function(resp) {
        $state.go('quoteIndex');
      })
      .catch(function(resp) {
        console.log(resp);
      });
    };

    $scope.$on('$stateChangeSuccess',
    function(event, toState, toParams, fromState, fromParams){
      if(toState.name == 'signout') {
        $auth.signOut();
      }
    });

  });
})();
