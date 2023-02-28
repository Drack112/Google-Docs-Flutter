import "dotenv/config";

const db = {
  uri: `mongodb://${process.env.MONGO_USER}:${process.env.MONGO_PASSWORD}@db:27017/${process.env.MONGO_DB}?authSource=admin`,
};

export default db;
