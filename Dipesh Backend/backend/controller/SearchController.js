import Product from '../models/postModel.js'; // Update the import statement to use ES modules

// Search Controller
export const searchProducts = async (req, res) => {
    const { query } = req.query;

    if (!query) {
        return res.status(400).json({ error: 'Query parameter is required' });
    }

    try {
        const results = await Product.find({
            $or: [
                { name: new RegExp(query, 'i') },
                { description: new RegExp(query, 'i') },
                // { category: new RegExp(query, 'i') }
            ]
        });

        res.json(results);
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while searching' });
    }
};
