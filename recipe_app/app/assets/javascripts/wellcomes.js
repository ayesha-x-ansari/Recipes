$(function() {

  // in the recipe div, when you click on .js-more-recipe ("Read More" link)
  $(".js-more").on('click',  function(event) {
    // this.dataset.id; grabs data-id of 'Read More' link, which is === recipe.id
    var id = $(this).data("id");

    // grab the text of the link to change it to "read less" if it's "read more" and vice versa.
    var text = $(this).text();

    if(text === "Read More") {

      // change the text of link from "read more" to "read less"
      $(this).text('Read Less');

      $.get("/recipes/" + id + ".json", function(data) {

        // replace div of id="description-#", "read more" link with recipe's description
        $("#description-" + id).text(data.description); })

    } else {

      // change the text of link from "read less" to "read more"
      $(this).text('Read More');

      $.get("/recipes/" + id + ".json", function(data) {

        // replace div of id="description-#", "read less" link with recipe's truncated description
        $("#description-" + id).text(data.description.substring(1,30) + " ...")  })
      }
    })

    $("#sortRecipes").on('click',  function(event) {
      $.get("/wellcomes" + ".json", function(data){
        let recipes = (data)

        // sorts recipe by title in alphabetical order.
        sortRecipesByTitle(recipes)
        debugger
        // div where recipe will be appended after html formating and moving data
        let recipePage = $(".sortedRecipes")

        // empty the div
        recipePage.empty()

        // iterate over each recipe JSON object, and then insert back iinto recipePage div.
        $.each (recipes, function(index, recipe) {
            recipePage.append(
              `<div class="row">
                  <div class="col=md-8 col-md-offset-1">
                    <div class='card-body'>
                      <h5 class='recipeTitle'> <li> <a href='/recipes/${recipe.id}'>${recipe.title}</a>  </li><h5>
                      <h6 class='recipeDescription'> ${recipe.description }</h6>
                    </div>
                  </div>
               </div>` )
          })
      })
    })
    event.preventDefault()
  })
