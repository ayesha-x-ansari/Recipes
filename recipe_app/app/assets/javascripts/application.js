// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require cocoon
//= require comments
//= require recipes
//= require wellcomes
//= require activestorage
//= require_tree .

// sorts recipe by title in decending order.
function sortRecipesByTitle(recipes) {
    //sort Recipe object array by title
    recipes.sort(function(firstRecipe, secondRecipe) { 
      //convert recipe title to lower case and store it in a variable
      let firstRecipeTitle  = firstRecipe.title.toLowerCase();
      let secondRecipeTitle = secondRecipe.title.toLowerCase();
      //sort in alphabetical order 
      if (firstRecipeTitle < secondRecipeTitle) { 
        return -1;
      } else if (firstRecipeTitle > secondRecipeTitle) {
        return 1;
      } 
      return 0;
    });
  }
  
