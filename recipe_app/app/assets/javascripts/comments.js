$(function () {
//**************************************************************************************************************
// on submit of form class="new_comment"
//**************************************************************************************************************
  $('form').on("submit", function(event) {
    $.ajax({
      type: "POST",
      url: this.action, // this refers to whatever triggered the action === [object HTMLFormElement]
      data: $(this).serialize(), // takes our form data and serializes it
      success: function(response) {
        // on success, update the DOM with response in the form of data

        let comment = new Comment(response);
        comment.createCommentsDiv();
        comment.clearFormFields();
      }
    });
    event.preventDefault();
  })
}).error(function(notNeeded){
alert("we broke!!!!")
 });



//*******************************************************************************************************************
// a new comment's response is passed as data and attributes are set to 'this'.
//*******************************************************************************************************************
function Comment(data) {
  this.id = data.id;
  this.content = data.content;
  this.recipe_id  = data.recipe_id;
  this.user = data.user;
};



//*******************************************************************************************************************
// this method appends html to the div id="submitted-comments"
//*******************************************************************************************************************
Comment.prototype.createCommentsDiv = function() {
  let html = "" ;
  html +=
    ` <div class=\'col=md-7 col-md-offset-2'>
        <p>Comment By: ${this.user.name} - ${this.content} <br>
          <a href='/recipes/${this.recipe_id}/comments/${this.id}/edit'>  Edit Comment</a>
          <a href = "#" class = "btn btn-link deleteComment" data-id="${this.id}" data-recipe-id="${this.recipe_id}">Delete Comment</a>
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

