$(function() {
  // in the recipe div, when you click on .js-more ("see description" link)
  $(".js-more").on('click',  function(event) {
    // this.dataset.id; grabs data-id of 'see descriptions' link, which is === recipe.id

    var id = $(this).data("id");

    var text = $(this).text();

    if(text === "Read More") {
      $(this).text('Read Less');
      $.get("/recipes/" + id + ".json", function(data) {
        // replace div of id="description-#", "see descriptions" link with recipe's description
        $("#description-" + id).text(data.description); })
    } else {
      $(this).text('Read More');
      $.get("/recipes/" + id + ".json", function(data) {
        // replace div of id="description-#", "see descriptions" link with recipe's description
        $("#description-" + id).text(data.description.substring(1,30) + " ...")  })
      }
    event.preventDefault();
  })
  })
