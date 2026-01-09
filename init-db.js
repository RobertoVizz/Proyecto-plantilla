import fs from "fs";
import pkg from "pg";

const { Client } = pkg;

const client = new Client({
  connectionString: process.env.DATABASE_URL,
  ssl: { rejectUnauthorized: false }
});

async function main() {
  await client.connect();
  const sql = fs.readFileSync("schema.sql", "utf8");
  await client.query(sql);
  console.log("SQL ejecutado correctamente");
  await client.end();
}

main();
