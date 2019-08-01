$(document).ready(() => {

    const updateChat = (data, sender) => {
      const getAMPM = (hour) => {
        if (hour > 12) {
          return "PM"
        }
        return "AM"
      }

      const formatDate = (date) => {
        return `${date.getHours()}:${date.getMinutes()} ${getAMPM(date.getHours())}`;
      };

      $('.chat-box').append(`
        <div class="chat-bubble-wrapper">
          <div class="chat-bubble d-flex ${sender}">
            <div><img src="${data.avatar}" alt="" class="avatar"></div>
            <div class="pl-2">
              <div class="d-flex align-items-center">
                <div class="chat-username m-0">${data.fullName}  ·  </div>
                <div class="chat-timestamp m-0 ${sender}">${formatDate(new Date(data.created_at))}</div>
              </div>
              <div class="chat-message">${data.content}</div>
            </div>
          </div>
        </div>
      `);
    };


    $('#chat-form').on('ajax:success', function(data) {
      $('#chat-form')[0].reset();
    });

    const pusher = new Pusher('cb7ff97e118c97ddc377', {
      cluster: 'us2',
      encrypted: true
    });

    const chatChannel = pusher.subscribe('message');

    const notification = chat => {
      chatBtn = document.getElementById(`chat-booking-${chat.booking_id}`);
      if (chatBtn) {
        chatBtn.innerHTML = "(You have new messages)";
      }
    };

    let offer_id = $('.chat-box').data("booking_id")
    let current_user = $('.chat-box').data("current_user")

    chatChannel.bind('new', function(data) {
      notification(data);
      let sender = data.user_id == current_user ? "me" : "him"
      if (data.offer_id == offer_id) {
        updateChat(data, sender);
        let chatBox = document.querySelector('.chat-box');
        chatBox.scrollTop = chatBox.scrollHeight - chatBox.clientHeight;
      }
    });
  });
