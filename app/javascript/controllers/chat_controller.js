import ApplicationController from './application_controller'

export default class extends ApplicationController {
  connect() {
    console.log('chat controller connected')
    window.addEventListener('turbo:submit-end', (event) => {
      console.log('turbo:submit-end', event)
      if (event.detail.fetchResponse.response.url.includes("/chat_rooms/10/chat_messages")) {
        var observer = new MutationObserver(function(mutations) {
          mutations.forEach(function(mutation) {
            let lastMessage = mutation.addedNodes[0].children[0]

            const userId = window.location.href.split('/')[5]
            console.log('userId', userId)
            console.log('lastMessage userId', lastMessage.dataset.userId)
            if (lastMessage.dataset.userId != userId) {
              lastMessage.classList.remove('bg-gray-300')
              lastMessage.classList.add('bg-blue-300')
              lastMessage.classList.add('float-right')
            }
          })
        })

        let config = { attributes: true, childList: true, characterData: true };
        observer.observe(this.element, config);
      }
    });
  }
}
