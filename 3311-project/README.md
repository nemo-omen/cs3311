# CS3311 Final Project

## Ideas
- markdown notebook with preview
  - backlinking?
- recipes app
- gradebook*
- RSS Reader?


### Gradebook

#### Features
- user management
- meh, I like this idea less and less as the moments pass

### Markdown Notebook
#### Features
- user management (log in etc)
- document management (CRUD)
  - autosave (after 10s of inactivity, every 1 min otherwise)
  - side-by-side preview
  - backlinks?(nice-to-have -- maybe not for the class version)
- markdown
  - WYSYWIG styling?
- directories? (tree structure - how to store in SQL? -- children(0-M), parent(M-1))
  - record type would be dir: 
 ```js
Directory {
  name: String,
  children: String[],
  parent: Directory{}
}

Note {
  name: String,
  parent: Directory{},
  contents: MDAST Node{},
  owner: User{}
}
 ```
- drag/drop file organization?(nice-to-have)

#### Routes


`/` Client-side app

`get(/notes)` - get notes

`get(/notes/:id)` - get note

`put(/notes/:id)` - update note

`delete(/notes/:id)` - delete note

`delete(/notes/)` - delete all notes

### Notes/Resources:

[Database seeding in Node js](https://levelup.gitconnected.com/database-seeding-in-node-js-2b2eec5bfaa1)

[Svelte RealWorld](https://github.com/sveltejs/realworld)