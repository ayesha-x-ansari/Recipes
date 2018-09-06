// The below code is for ingredients Show Page, /ingredients/1
// show pages have next and previous buttons that append with Recipes for each ingredient.

$(function(){
  $(".js-next-ingredient").on("click", function (event) {
    // get the id from the data-id attribute (current id) assign it to id
    let nextId = parseInt($(".js-previous-ingredient").attr("data-id"))
           nextId = nextId + 1
           alert(nextId)

    // get previous ingredient
    $.get("/ingredients/"  + nextId +   "/data", function(data) {

      // pass data to loadIngredient
      //loadIngredient(data)
      $(".ingredientName").text(data["name"]);
      $(".js-next-ingredient").attr("data-id", data["id"]);
      $(".js-previous-ingredient").attr("data-id",data["id"]);
    })
    event.preventDefault();
  })
})

$(function(){
  $(".js-previous-ingredient").on("click", function (event) {
    // get the id from the data-id attribute (current id) assign it to id
    let previousId = parseInt($(".js-next-ingredient").attr("data-id"))
     previousId = previousId - 1
    // get next ingredient
    $.get("/ingredients/"  +  previousId  +  "/data", function(data) {
      // pass data to loadingredient
      loadIngredient(data)
      $(".ingredientName").text(data["name"]);
      $(".js-next-ingredient").attr("data-id", data["id"]);
      $(".js-previous-ingredient").attr("data-id",data["id"]);

    })
    event.preventDefault();
  })
})

function loadIngredient(data) {
  alert("abc")
  alert ("fffffff")
  // change the URL to the new route
  history.pushState({}, "", "/ingredients/" + data.id)

  // re-set the id to current on the buttons

  // replace header with following ingredient name
  $(".ingredientName").text(data["name"]);
  $(".js-next-ingredient").attr("data-id", data["id"]);
  $(".js-previous-ingredient").attr("data-id",data["id"]);

  // div where formulas go
  let ingredientRecipePage = $("#ingredientRecipePage")

  // empty the div
  ingredientRecipePage.empty()

  // array of all Recipes in the ingredient
  let recipes = (data["recipe_list"])

  // iterate over each Ingredientin the Recipe_list JSON object, and then insert back into ingredientRecipePage div.
  $.each (recipes, function(index, recipe) {
    ingredienRecipePage.append(
      `<div class='ingredientRecipe col-lg-3'>
        <div class='card border-light' style='max-width: 15rem; min-width: 15rem;'>
          <div class='card-body'>
          <h5 class='recipeTitle'><a href='/Recipes/${Recipe.id}'>${Recipe.title}</a>
          <h5 class='recipeDecription'> recipe.decription </h5>
          </div>
        </div><br>
      </div>`
    )
  })
}
