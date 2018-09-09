$(function () {
  // on submit of form class="new_comment"
  $('form').on("submit", function(event) {
    $.ajax({
      type: "POST",
      url: this.action, // this refers to whatever triggered the action === [object HTMLFormElement]
      data: $(this).serialize(), // takes our form data and serializes it
      success: function(response) {
        event.preventDefault();
        // on success, update the DOM with response in the form of data

        let comment = new Comment(response);
        comment.renderComments();
        $(".commentBox").val("");
      }
    });
    event.preventDefault();
  })
}).error(function(notNeeded){
alert("we broke!!!!")
 });
// a new comment's response is passed as data and attributes are set to 'this'.
function Comment(data) {
  this.id = data.id;
  this.content = data.content;
  this.recipe_id  = data.recipe_id;
  this.user = data.user;
};
// this method appends html to the div id="submitted-comments"
Comment.prototype.renderComments = function() {
  let html = "" ;
  html +=
    ` <div class=\'col=md-7 col-md-offset-2'>
        <p>Comment By: ${this.user.name} - ${this.content} <br>
          <a href='/recipes/${this.recipe_id}/comments/${this.id}/edit'>  Edit Comment</a>   <a data-confirm="Are you sure?" class="btn btn-link" rel="nofollow" data-method="delete" href="/recipes/${this.recipe_id}/comments/${this.id}">Delete Comment</a>
        </p>
      </div>`;
  $("#submitted-comments").append(html);
  $(".commentBox").val("");
  $(".ratingSelection").val("");
};
