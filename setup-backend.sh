#!/bin/bash

echo "🚀 Setting up Bazar Wheels Hub Backend..."

# Navigate to backend directory
cd backend

# Install dependencies
echo "📦 Installing backend dependencies..."
npm install

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file..."
    cat > .env << EOF
PORT=5000
MONGODB_URI=mongodb://localhost:27017/bazar-wheels
JWT_SECRET=your-super-secret-jwt-key-here-make-it-long-and-random-123456789
NODE_ENV=development
EOF
    echo "✅ .env file created successfully!"
else
    echo "⚠️  .env file already exists, skipping creation"
fi

echo ""
echo "🎉 Backend setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Make sure MongoDB is running (mongod or MongoDB Atlas)"
echo "2. Start the backend server: cd backend && npm run dev"
echo "3. Start the frontend: npm run dev"
echo ""
echo "🔗 Backend will be available at: http://localhost:5000"
echo "🔗 Frontend will be available at: http://localhost:5173"
