<% if flash[:error_messages] %>
  <div class="error_messages">
    <ul>
      <% flash[:error_messages].each do |message| %>
        <li><%= message %></li>
      <% end %>
    </ul>
  </div>
<% end %>