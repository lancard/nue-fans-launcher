cordova.define('cordova/plugin_list', function(require, exports, module) {
  module.exports = [
    {
      "id": "cordova-plugin-geolocation.geolocation",
      "file": "plugins/cordova-plugin-geolocation/www/android/geolocation.js",
      "pluginId": "cordova-plugin-geolocation",
      "clobbers": [
        "navigator.geolocation"
      ]
    },
    {
      "id": "cordova-plugin-geolocation.PositionError",
      "file": "plugins/cordova-plugin-geolocation/www/PositionError.js",
      "pluginId": "cordova-plugin-geolocation",
      "runs": true
    },
    {
      "id": "cordova-plugin-sensors.sensors",
      "file": "plugins/cordova-plugin-sensors/www/sensors.js",
      "pluginId": "cordova-plugin-sensors",
      "clobbers": [
        "sensors"
      ]
    }
  ];
  module.exports.metadata = {
    "cordova-plugin-geolocation": "4.1.0",
    "cordova-plugin-sensors": "0.7.0"
  };
});