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
        console.log(Auth._currentUser);
      })
      .catch(function(resp) {
        console.log("Signin failure:", resp);
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
