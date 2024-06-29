import express from 'express';
import { searchProducts } from '../controller/SearchController.js'; // Import the controller function
import  authMiddleware  from '../middleware/auth.js'

const Searchrouter = express.Router();

// Define the search route
Searchrouter.get('/search', authMiddleware,searchProducts);

export default Searchrouter;
