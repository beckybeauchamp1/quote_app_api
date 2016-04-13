"use strict";

console.log('category');
(function(){
  angular
  .module("categories")
  .factory("CategoryFactory", [
    "$resource",
    CategoryFactoryFunction
  ]);

  function CategoryFactoryFunction($resource){
    return $resource("https://beckys-quote-app.herokuapp.com/categories/:id.json", {},
    {
      update: {
        method: "PUT"
      },
      all:{
        method: "GET",
        url: "https://beckys-quote-app.herokuapp.com/categories.json",
        isArray: true
      },
      one: {
        method: "GET",
        url: "https://beckys-quote-app.herokuapp.com/categories/:id.json"
      }
    });
  }
}());
