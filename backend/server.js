const express = require('express');
const app = express();
const port = 3001;

app.get('/api/health', (req, res) => {
  res.json({ status: 'Backend running' });
});

app.listen(port, () => {
  console.log(`Backend listening at http://localhost:${port}`);
});
