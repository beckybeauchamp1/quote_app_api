(function(){
  angular
  .module("signin", [])
  .controller("GoogleCtrl", function($scope, $rootScope){

    function onSignIn(googleUser) {
      console.log(googleUser)
      profile = googleUser.getBasicProfile();
      $scope.profile = profile;
      id = profile.getId();
      name = profile.getName();
      $scope.username = profile.getName();
      console.log(id)
      $("body").append('<h2>'+ name +'</h2>')
      // console.log('ID: ' + profile.getId());
      // console.log('Name: ' + profile.getName());
      // console.log('Image URL: ' + profile.getImageUrl());
      // console.log('Email: ' + profile.getEmail());
      var id_token = googleUser.getAuthResponse().id_token;
      console.log("ID Token: " + id_token);
      return $scope.profile;
    }

    window.onSignIn = onSignIn;

  });

}());
