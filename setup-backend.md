# Backend Setup Instructions

## Prerequisites

1. **Node.js** (v14 or higher)
2. **MongoDB** (local installation or MongoDB Atlas cloud)

## Quick Setup

### 1. Install Backend Dependencies

```bash
cd backend
npm install
```

### 2. Environment Configuration

Create a `.env` file in the `backend` directory:

```env
PORT=5000
MONGODB_URI=mongodb://localhost:27017/bazar-wheels
JWT_SECRET=your-super-secret-jwt-key-here-make-it-long-and-random
NODE_ENV=development
```

### 3. Start MongoDB

**Option A: Local MongoDB**

```bash
# If you have MongoDB installed locally
mongod
```

**Option B: MongoDB Atlas (Cloud)**

- Sign up at [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
- Create a free cluster
- Get your connection string and update `MONGODB_URI` in `.env`

### 4. Start the Backend Server

```bash
# Development mode (with auto-restart)
npm run dev

# Or production mode
npm start
```

The backend will be available at `http://localhost:5000`

## API Endpoints

- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `GET /api/auth/verify` - Verify JWT token
- `GET /api/auth/me` - Get current user
- `GET /api/health` - Health check

## Testing the API

You can test the API using curl or Postman:

```bash
# Register a new user
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@example.com","password":"password123"}'

# Login
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"john@example.com","password":"password123"}'
```

## Frontend Integration

The frontend is already configured to proxy API requests to the backend during development. The Vite configuration includes:

```typescript
proxy: {
  '/api': {
    target: 'http://localhost:5000',
    changeOrigin: true,
    secure: false,
  },
}
```

## Troubleshooting

1. **MongoDB Connection Issues**

   - Ensure MongoDB is running
   - Check the connection string in `.env`
   - Verify network connectivity for cloud MongoDB

2. **Port Already in Use**

   - Change the PORT in `.env` file
   - Kill any process using port 5000: `lsof -ti:5000 | xargs kill -9`

3. **CORS Issues**
   - The backend is configured to allow requests from `http://localhost:3000` and `http://localhost:5173`
   - Update CORS configuration in `server.js` if using different ports

## Production Deployment

For production deployment:

1. Set `NODE_ENV=production`
2. Use a strong, unique JWT secret
3. Configure proper CORS origins
4. Use a production MongoDB instance
5. Set up environment variables securely
6. Consider using PM2 for process management
