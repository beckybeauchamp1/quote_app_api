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
    return $resource("http://localhost:3000/categories/:id", {},
    {
      update: {
        method: "PUT"
      },
      all:{
        method: "GET",
        url: "http://localhost:3000/categories",
        isArray: true
      },
      one: {
        method: "GET",
        url: "http://localhost:3000/categories/:id"
      }
    });
  }
}());
