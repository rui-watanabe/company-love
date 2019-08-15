$(function(){
  function buildMessage(message){
    var html =  `<div class="chat" data-chat-id="${message.id}">
                  <div class="chat-box">
                  <div class="chat-face">
                  <img style="width:100px; height:100px;" src="http://localhost:3000/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--9a1a6ec25f629d85cdc814e24a22f2a07b002ab2/${message.avatar}"></div>
                  <div class="chat-hukidashi">
                        <strong>${message.content}</strong>
                        <br>${message.date}
                  </div>
                  </div>
                  </div>`
    return html;
  }
  $("#new_message").on("submit", function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildMessage(data);
      $('.chats').append(html)
      $('html,body').animate({scrollTop: $('.chats')[0].scrollHeight}, 'fast');
      $("form")[0].reset();
    })
    .fail(function(){
    alert('error');
    })
  })
});