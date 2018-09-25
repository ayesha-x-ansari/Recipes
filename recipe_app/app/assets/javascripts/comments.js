//********************************************************************************************************************
// in the recipe div, when you click on .js-more-recipe ("Read More" link)
//********************************************************************************************************************
$(function () {
  newComment()
  deleteComment()
  debugger
})

//*******************************************************************************************************************
// ADD's a comment on the same page without page refresh on submit of form with class="new_comment"
//*******************************************************************************************************************
  
let newComment = function (){ 
      
  $("#new_comment").on("submit", function(event) {

    event.preventDefault()

    $.ajax({
      type: "POST",              // this is a POST request
      url: this.action,          // this refers to whatever triggered the action === [object HTMLFormElement]
      data: $(this).serialize()
      }).done(function(data){
        // instantiate a comment ohject
        let comment = new Comment(data);

        // invoke prototype function to move data to DIV and then append that div to $("#submitted-comments") selector
        comment.createCommentsDiv();

        // invoke prototype function to clear the comment form fields
        comment.clearFormFields();

        //In case of error alert withe error message
        }).fail(function(error){
          alert(error.statusText);
        });
      });
  }


//*******************************************************************************************************************
// a new comment's response is passed as data and attributes are set to 'this'.
//*******************************************************************************************************************
function Comment(data) {
    this.id = data.id;
    this.content = data.content;
    this.recipeId  = data.recipe_id;
    this.user = data.user;
  };

  //*******************************************************************************************************************
  // this method appends html to the div id="submitted-comments"
  //<p>Comment By: ${this.user.name} - ${this.content} <br>
  //*******************************************************************************************************************
  Comment.prototype.createCommentsDiv = function() {
    let html = "" ;
    html +=
      ` <div class=\'col=md-7 col-md-offset-2'>
             <p>Comment By: ${this.user.name} - ${this.content} <br>
            <a href='/recipes/${this.recipeId}/comments/${this.id}/edit'>  Edit Comment</a>
            <a href = "#" class = "btn btn-link deleteComment" data-id="${this.id}" data-recipe-id="${this.recipeId}">Delete Comment</a>
          </p>
        </div>`;
    $("#submitted-comments").append(html);
    };

  //*******************************************************************************************************************
  //clears input fields of comment form
  //*******************************************************************************************************************
  Comment.prototype.clearFormFields = function() {
    $(".commentBox").val("");
    $(".ratingSelection").val("");

  }

  //********************************************************************************************************************
  // DELETE a comment: On click of button with deleteComment class
  //********************************************************************************************************************
  let deleteComment  = function (){ 
    $("#submitted-comments").on("click",'.deleteComment',function(event){
      debugger
      event.preventDefault()
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
   }
