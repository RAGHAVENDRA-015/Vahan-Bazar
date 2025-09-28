const mongoose = require("mongoose");
require("dotenv").config();

async function testConnection() {
  try {
    console.log("🔍 Testing MongoDB connection...");
    console.log("MongoDB URI:", process.env.MONGODB_URI);

    await mongoose.connect(
      process.env.MONGODB_URI || "mongodb://localhost:27017/bazar-wheels",
      {
        useNewUrlParser: true,
        useUnifiedTopology: true,
      }
    );

    console.log("✅ MongoDB connected successfully!");
    console.log("📊 Database name:", mongoose.connection.db.databaseName);

    // Test creating a simple document
    const testSchema = new mongoose.Schema({
      name: String,
      createdAt: { type: Date, default: Date.now },
    });

    const TestModel = mongoose.model("Test", testSchema);

    const testDoc = new TestModel({ name: "Backend Test" });
    await testDoc.save();
    console.log("✅ Test document created successfully!");

    // Clean up test document
    await TestModel.deleteOne({ _id: testDoc._id });
    console.log("🧹 Test document cleaned up");

    await mongoose.disconnect();
    console.log("✅ MongoDB disconnected successfully!");
    console.log("🎉 Backend database connection test passed!");
  } catch (error) {
    console.error("❌ Database connection failed:", error.message);
    console.log("\n💡 Troubleshooting tips:");
    console.log("1. Make sure MongoDB is running locally: mongod");
    console.log("2. Or use MongoDB Atlas cloud database");
    console.log("3. Check your MONGODB_URI in .env file");
    process.exit(1);
  }
}

testConnection();
