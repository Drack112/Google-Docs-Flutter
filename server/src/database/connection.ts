import mongoose from "mongoose";

import db from "../config/database";

const connection = mongoose.connect(
  db.uri,
  {
    autoIndex: true,
  },
  async (err) => {
    if (err) {
      console.log("🚨 Error trying connect do MongoDB\n" + err);
    } else {
      console.log("📪 Connected to MongoDB.");
    }
  },
);

export default connection;
