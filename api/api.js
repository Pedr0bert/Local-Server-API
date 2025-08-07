import express from 'express';
import mongoose from 'mongoose';
import cors from 'cors';

const app = express();
const PORT = 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Conecte ao MongoDB Atlas
mongoose.connect(process.env.MONGO_URI)
  .then(() => console.log("MongoDB conectado"))
  .catch(err => console.error(err));

// Schema e modelo
const PesagemSchema = new mongoose.Schema({
  uid: String,
  nome: String,
  tipo: String, // entrada ou pesagem
  peso: Number,
  saco: Number,
  timestamp: Number,
}, { timestamps: true });

const Pesagem = mongoose.model('Pesagem', PesagemSchema);

// Rota principal
app.post('/api/pesagem', async (req, res) => {
  try {
    const dados = req.body;
    const novaPesagem = new Pesagem(dados);
    await novaPesagem.save();
    res.json({ status: 'ok', id: novaPesagem._id });
  } catch (err) {
    res.status(500).json({ status: 'erro', erro: err.message });
  }
});

app.listen(
    PORT, 
    () => console.log(`API rodando em http://localhost:${PORT}`)
);