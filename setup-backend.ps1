Write-Host "🚀 Setting up Bazar Wheels Hub Backend..." -ForegroundColor Green

# Navigate to backend directory
Set-Location backend

# Install dependencies
Write-Host "📦 Installing backend dependencies..." -ForegroundColor Yellow
npm install

# Create .env file if it doesn't exist
if (-not (Test-Path ".env")) {
    Write-Host "📝 Creating .env file..." -ForegroundColor Yellow
    @"
PORT=5000
MONGODB_URI=mongodb://localhost:27017/bazar-wheels
JWT_SECRET=your-super-secret-jwt-key-here-make-it-long-and-random-123456789
NODE_ENV=development
"@ | Out-File -FilePath ".env" -Encoding UTF8
    Write-Host "✅ .env file created successfully!" -ForegroundColor Green
} else {
    Write-Host "⚠️  .env file already exists, skipping creation" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎉 Backend setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next steps:" -ForegroundColor Cyan
Write-Host "1. Make sure MongoDB is running (mongod or MongoDB Atlas)" -ForegroundColor White
Write-Host "2. Start the backend server: cd backend && npm run dev" -ForegroundColor White
Write-Host "3. Start the frontend: npm run dev" -ForegroundColor White
Write-Host ""
Write-Host "🔗 Backend will be available at: http://localhost:5000" -ForegroundColor Blue
Write-Host "🔗 Frontend will be available at: http://localhost:5173" -ForegroundColor Blue
