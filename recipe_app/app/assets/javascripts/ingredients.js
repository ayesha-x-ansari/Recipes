//********************************************************************************************************************
// document ready function
//********************************************************************************************************************
$(function(){
  nextIngredient()
  previousIngredient() 
})

//********************************************************************************************************************
// show page have next and previous buttons that show next ingredient when next ingredient button is clicked
// and gets all recipes for that ingredient and appends it on the page without page refresh, div is appended by
// function loadIngredient() function.
//********************************************************************************************************************
let nextIngredient = function () { 
  $(".js-next-ingredient").on("click", function (event) {
    // get the id from the data-id attribute (current id) assign it to id
    let nextId = parseInt($(".js-previous-ingredient").attr("data-id"))
    // get next ingredient
    nextId = nextId + 1

    $.get("/ingredients/"  + nextId +  ".json", function(data) {

      // pass data to loadIngredient
      loadIngredient(data)
      })
    event.preventDefault()
  })
}

//********************************************************************************************************************
// show page have next and previous buttons that show previous ingredient when previous ingredient button is clicked
// and gets all recipes for that ingredient and appends it on the page without page refresh, div is appended by
// function loadIngredient() function.
//********************************************************************************************************************
let previousIngredient = function(){ 
  $(".js-previous-ingredient").on("click", function (event) {
    // get the id from the data-id attribute (current id) assign it to id
    let previousId = parseInt($(".js-next-ingredient").attr("data-id"))
    // get previous ingredient
    previousId = previousId - 1

    $.get("/ingredients/"  +  previousId  +  ".json", function(data) {
      // pass data to loadingredient
      loadIngredient(data)
    })
    event.preventDefault();
  })
}

//********************************************************************************************************************
//this function gets data empty div and then format div, move data and then append formatted div.
//********************************************************************************************************************
function loadIngredient(data) {

  // change the URL to the new route
  history.pushState({}, "", "/ingredients/" + data.id)

  // replace header with following ingredient name
  $(".ingredientName").text(data["name"]);

  // re-set the id to current on the buttons
  $(".js-next-ingredient").attr("data-id", data["id"]);
  $(".js-previous-ingredient").attr("data-id",data["id"]);

  // div where recipe go
  let ingredientRecipePage = $("#ingredientRecipePage")

  // empty the div
  ingredientRecipePage.empty()

  // array of all recipes in the ingredient
  let recipes = (data["recipes"])

  // iterate over each Ingredient in the recipe JSON object, and then insert back into ingredientRecipePage div.
  $.each (recipes, function(index, recipe) {
    ingredientRecipePage.append(
      `<div class="row"  id="ingredientRecipePage">
        <div class="col=md-8 col-md-offset-1">
          <div class='card-body'>
            <ul>
              <h5 class='recipeTitle'> <li> <a href='/recipes/${recipe.id}'>${recipe.title}</a>  </li><h5>
              <h6 class='recipeDescription'> ${recipe.description }</h6>
            </ul>
          </div>
        </div>
      </div>` )
  })
}
