# Database Setup Guide

## Option 1: MongoDB Atlas (Recommended - Cloud Database)

### Step 1: Create MongoDB Atlas Account

1. Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Sign up for a free account
3. Create a new cluster (free tier available)

### Step 2: Get Connection String

1. In your Atlas dashboard, click "Connect" on your cluster
2. Choose "Connect your application"
3. Copy the connection string (it looks like: `mongodb+srv://username:password@cluster.mongodb.net/`)

### Step 3: Update .env File

Replace the MONGODB_URI in your `backend/.env` file:

```env
PORT=5000
MONGODB_URI=mongodb+srv://your-username:your-password@your-cluster.mongodb.net/bazar-wheels?retryWrites=true&w=majority
JWT_SECRET=your-super-secret-jwt-key-here-make-it-long-and-random-123456789
NODE_ENV=development
```

## Option 2: Local MongoDB Installation

### Windows:

1. Download MongoDB from [mongodb.com](https://www.mongodb.com/try/download/community)
2. Install MongoDB Community Server
3. Start MongoDB service: `net start MongoDB`
4. Or run manually: `mongod`

### macOS:

```bash
# Using Homebrew
brew tap mongodb/brew
brew install mongodb-community
brew services start mongodb/brew/mongodb-community
```

### Linux (Ubuntu):

```bash
# Import MongoDB public key
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

# Create list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Install MongoDB
sudo apt-get update
sudo apt-get install -y mongodb-org

# Start MongoDB
sudo systemctl start mongod
```

## Testing the Connection

After setting up MongoDB (either Atlas or local), test the connection:

```bash
cd backend
node test-backend.js
```

You should see:

```
✅ MongoDB connected successfully!
📊 Database name: bazar-wheels
✅ Test document created successfully!
🧹 Test document cleaned up
✅ MongoDB disconnected successfully!
🎉 Backend database connection test passed!
```

## Quick Start with MongoDB Atlas (Recommended)

1. **Sign up at MongoDB Atlas**: https://www.mongodb.com/cloud/atlas
2. **Create a free cluster** (M0 Sandbox)
3. **Get your connection string** from the "Connect" button
4. **Update your .env file** with the Atlas connection string
5. **Test the connection** with `node test-backend.js`

This is the easiest way to get started without installing MongoDB locally!
