import Reef from 'https://cdn.jsdelivr.net/npm/reefjs@10/dist/reef.es.min.js';

let app = new Reef('#app', {
  template: `<h1>Hello, Reef!</h1>`
});

app.render();