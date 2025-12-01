const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
    res.send('<h1>Atividade DevOps - Pipeline Funcionando!</h1>');
});

app.listen(PORT, () => {
    console.log(`App rodando na porta ${PORT}`);
});