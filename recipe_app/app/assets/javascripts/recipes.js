
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

//###############################################################################################################################
//###############################################################################################################################
//click event for comment delete

$("#submitted-comments").on("click",'.deleteComment',function(event){

  event.preventDefault();

  let id = $(this).data("id");

  let  deleteUrl = "/comments/" + id;

  //saved container div for later fadeout
  var parentDiv = $(this).parent();

  $.ajax({
    url: deleteUrl,
    //older browser support. Should I worry about this or is it okay to use type:'DELETE'?
    type: "POST", data:{"_method": "DELETE"}

  }).done(function(data){

    //fadeout effect for comment container
    $(parentDiv).fadeOut("slow");

  }).fail(function(error){

    alert(error.statusText);
  });
});
