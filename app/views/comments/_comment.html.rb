<div class="comment">
  <div class="comment-header">
    <%= comment.name %>
  </div>
  <div class="comment-body">
    <%= comment.comment %>
  </div>
  <div class="comment-footer">
    <%= link_to "削除", comment_path(comment), method: :delete, data: { confirm: "本当に削除しますか？" }, class: "btn btn-danger" %>
  </div>
</div>