"use strict";

(function(){
  angular
  .module("users")
  .factory("UserFactory", [
    "$resource",
    UserFactoryFunction
  ]);

  function UserFactoryFunction($resource){
    return $resource("https://beckys-quote-app.herokuapp.com/quotes/favorites", {},
    {
      update: {
        method: "PUT"
      }
    });
  }


}());
