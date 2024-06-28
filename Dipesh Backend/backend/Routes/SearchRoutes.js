import express from 'express';
import { searchProducts } from '../controllers/searchController.js'; // Import the controller function

const Searchrouter = express.Router();

// Define the search route
Searchrouter.get('/search', searchProducts);

export default Searchrouter;
