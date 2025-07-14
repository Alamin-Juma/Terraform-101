const express = require('express');
const app = express();
const port = 8080;

// Simple route that responds with "Hello World"..
app.get('/', (req, res) => {
  console.log('Received request at:', new Date());
  res.status(200).send('Hello from my ECS app! 🚀');
});

// Health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'healthy', timestamp: new Date() });
});

app.listen(port, () => {
  console.log(`App is running on port ${port}`);
});