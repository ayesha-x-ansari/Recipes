$(function () {

    //**************************************************************************************************************
    // on submit of form class="new_comment"
    //**************************************************************************************************************
    $("#new_comment").on("submit", function(event) {

      event.preventDefault()

      var values = $(this).serialize();

      var url =  this.action

      var commenting = $.post(url, values);

      commenting.done(function(data) {
      // TODO: handle response

      //$.ajax({
        // type: "POST",
         // url: this.action, // this refers to whatever triggered the action === [object HTMLFormElement]
         // data: $(this).serialize(), // takes our form data and serializes it
         // success: function(data) {
            //UUUUUUUUUUUUU on success, update the DOM with response in the form of data

          let comment = new Comment(data);
          comment.createCommentsDiv();
          comment.clearFormFields();
      })

    });

    $("#submitted-comments").on("click",'.deleteComment',function(event){

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
  })


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
