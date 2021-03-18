const express = require('express');
const app = express();
const port = 3000;
const axios = require('axios');
const bodyParser = require('body-parser');
const cors = require('cors');

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/', (_req, res) => res.send('Multilinks API'));

app.post('/shortByISGD', async (req, res) => {
  console.log(req.body);
  const linksToShort = req.body.linksToShort;

  const shortenedLinks = [];
  const makeShortLink = link => {
      return new Promise(resolve => {
          setTimeout(() => {
              axios.get(`https://is.gd/create.php?format=simple&url=${link}`)
                .then(({ data: shortLink }) => {
                  console.log(`Get shortened link ${shortLink}`);

                  resolve(shortLink);
                })
                .catch(console.log);
          }, 200);
      });
  };

  for (let i = 0; i < linksToShort.length; i++) {
      const link = linksToShort[i];
      const shortenedLink = await makeShortLink(link);

      shortenedLinks.push(shortenedLink);
  }
  res.send(shortenedLinks);
});

app.listen(process.env.PORT || port, () => console.log(`Listening at http://localhost:${port}`));
