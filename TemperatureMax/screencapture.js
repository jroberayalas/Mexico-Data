var page = require('webpage').create();
page.open('file:///Users/JRAS/Desktop/Mac%20Vieja/Escritorio/Academico/Mexico-Data/TemperatureMax/001_1985_ENERO.html', function() {
  page.render('prueba.png');
  phantom.exit();
});
