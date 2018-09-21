
$(function() {

  // in the recipe div, when you click on .js-more-recipe ("Read More" link)
  $(".js-more-recipe").on('click',  function(event) {

    // this.dataset.id; grabs data-id of 'Read More' link, which is === recipe.id
    let id = $(this).data("id");

    // grab the text of the link to change it to "read less" if it's "read more" and vice versa.
    let text = $(this).text();

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
      event.preventDefault();
    })
  })

