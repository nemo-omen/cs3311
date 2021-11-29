const path = require('path');
const { fileURLToPath } = require('url');
const { app, BrowserWindow } = require('electron');


const env = process.env.NODE_ENV || 'development';

// const __dirname = path.dirname(fileURLToPath(import.meta.url));

if (env === 'development') {
  require('electron-reload')(__dirname, {
      electron: path.join(__dirname, 'node_modules', '.bin', 'electron'),
      hardResetMethod: 'exit'
  });
}

const createWindow = () => {
  const win = new BrowserWindow({
    width: 800,
    height: 600,
    frame: true,
    autoHideMenuBar: true,
    webPreferences: {
      // preload: 'preload.js'
      preload: `preload.js`
    }
  });

  win.loadFile('render/index.html');

  win.webContents.openDevTools();
};

app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    if(BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  if(process.platform !== 'darwin') app.quit();
});