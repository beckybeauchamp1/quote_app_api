"use strict";

console.log('factory');
(function(){
  angular
  .module("quotes")
  .factory("QuoteFactory", [
    "$resource",
    QuoteFactoryFunction
  ]);

  function QuoteFactoryFunction($resource){
    return $resource("http://localhost:3000/quotes/:id", {},
    {
      update: {
        method: "PUT"
      },
      keyword: {
        method: "GET",
        params:{
          keyword: '@keyword'
        },
        url: "http://localhost:3000/quotes/search/:keyword",
        isArray: true
      },
      category: {
        method: "GET",
        params:{
          category: '@category'
        },
        url: "http://localhost:3000/categories",
        isArray: true,
      },
      addCategory:{
        method: "POST",
        params: {
          quote: '@quote',
          category: '@category'
        },
        url: "http://localhost:3000/addCategory",
        isArray: true,
      },
      grabCategories:{
        method: "GET",
        params: {
          id: '@id',
        },
        url: "http://localhost:3000/quotes/:id/categories",
        isArray: true,
        stripTrailingSlashes: false
      },
      addFavs:{
        method: "POST",
        params: {
          quote: '@quote',
          category: '@category'
        },
        url: "http://localhost:3000/quotes/favorites/new"
      }
    });
  }
}());
