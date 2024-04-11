const axios = require("axios");

module.exports = async function (context) {
  const res = await axios.get(
    "https://api.open-meteo.com/v1/forecast?latitude=43.6&longitude=3.8833&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m"
  );

  return {
    status: 200,
    body: {
      text: `La température actuelle à Montpellier est de ${res.data.current.temperature_2m}`,
    },
  };
};
