import Reef from 'https://cdn.jsdelivr.net/npm/reefjs@10/dist/reef.es.min.js';

let app = new Reef('#app', {
  data: {
    expanded: false,
  },
  template: `<h1>Hello, Reefers!</h1><p>Etc...</p>`
});

const menu = document.querySelector('.sidebar-menu');
const menuButton = document.querySelector('.sidebar-button');

menuButton.addEventListener('click', () => {
  app.data.expanded = !app.data.expanded
  if(app.data.expanded) {
    menu.classList.add('expanded');
  }else {
    menu.classList.remove('expanded');
  }
});

app.render();