```markdown
# MongoDB Shell Commands

**Connect**
```bash
mongo
```

**Show all databases**  
Lists all databases on the MongoDB server
```bash
show dbs
```

**Switch to a database**  
Switches to the specified database; creates it if it doesn't exist
```bash
use myDatabase
```

**Show current database**  
Displays the name of the currently active database
```bash
db
```

**Create a collection**  
Explicitly creates a collection named 'myCollection'
```bash
db.createCollection("myCollection")
```

**Show all collections in current database**  
Lists all collections in the current database
```bash
show collections
```

**Insert a single document**  
Inserts one document into the specified collection
```bash
db.myCollection.insertOne({ "name": "John", "age": 30, "city": "New York" })
```

**Insert multiple documents**  
Inserts multiple documents into the specified collection
```bash
db.myCollection.insertMany([{ "name": "Alice", "age": 25 }, { "name": "Bob", "age": 35 }])
```

**Find all documents**  
Retrieves all documents in the specified collection
```bash
db.myCollection.find()
```

**Find documents with pretty formatting**  
Displays all documents in a formatted, readable way
```bash
db.myCollection.find().pretty()
```

**Find one document**  
Retrieves the first document that matches the query
```bash
db.myCollection.findOne()
```

**Query documents by condition**  
Finds documents matching the specified criteria
```bash
db.myCollection.find({ "age": 30 })
```

**Query with greater than**  
Finds documents where age is greater than 25
```bash
db.myCollection.find({ "age": { $gt: 25 } })
```

**Query with less than**  
Finds documents where age is less than 35
```bash
db.myCollection.find({ "age": { $lt: 35 } })
```

**Query with multiple conditions (AND)**  
Finds documents matching all specified conditions
```bash
db.myCollection.find({ "age": 30, "city": "New York" })
```

**Query with OR condition**  
Finds documents matching any of the specified conditions
```bash
db.myCollection.find({ $or: [{ "age": 25 }, { "city": "New York" }] })
```

**Update a single document**  
Updates the first document matching the query
```bash
db.myCollection.updateOne({ "name": "John" }, { $set: { "age": 31 } })
```

**Update multiple documents**  
Updates all documents matching the query
```bash
db.myCollection.updateMany({ "city": "New York" }, { $set: { "country": "USA" } })
```

**Replace a document**  
Replaces the first document matching the query with a new one
```bash
db.myCollection.replaceOne({ "name": "John" }, { "name": "John Doe", "age": 32, "city": "Boston" })
```

**Delete a single document**  
Deletes the first document matching the query
```bash
db.myCollection.deleteOne({ "name": "Alice" })
```

**Delete multiple documents**  
Deletes all documents matching the query
```bash
db.myCollection.deleteMany({ "city": "New York" })
```

**Drop a collection**  
Deletes the specified collection
```bash
db.myCollection.drop()
```

**Drop a database**  
Deletes the current database
```bash
db.dropDatabase()
```

**Count documents in a collection**  
Returns the number of documents in the collection
```bash
db.myCollection.count()
```

**Count documents with a condition**  
Counts documents matching the specified query
```bash
db.myCollection.count({ "age": { $gt: 25 } })
```

**Sort documents (ascending)**  
Sorts documents by a field in ascending order (1 for ascending)
```bash
db.myCollection.find().sort({ "age": 1 })
```

**Sort documents (descending)**  
Sorts documents by a field in descending order (-1 for descending)
```bash
db.myCollection.find().sort({ "age": -1 })
```

**Limit the number of results**  
Restricts the number of documents returned
```bash
db.myCollection.find().limit(5)
```

**Skip documents**  
Skips the specified number of documents in the result
```bash
db.myCollection.find().skip(2)
```

**Create an index**  
Creates an index on a field to improve query performance
```bash
db.myCollection.createIndex({ "name": 1 })
```

**List indexes**  
Shows all indexes on a collection
```bash
db.myCollection.getIndexes()
```

**Drop an index**  
Removes an index by its name
```bash
db.myCollection.dropIndex("name_1")
```

**Drop all indexes**  
Removes all indexes from a collection (except _id)
```bash
db.myCollection.dropIndexes()
```

**Find distinct values**  
Returns unique values for a specified field
```bash
db.myCollection.distinct("city")
```

**Query with regular expression**  
Finds documents where a field matches a regex pattern
```bash
db.myCollection.find({ "name": /john/i })
```

**Aggregate with group by**  
Groups documents by a field and calculates a sum
```bash
db.myCollection.aggregate([{ $group: { _id: "$city", total: { $sum: 1 } } }])
```

**Aggregate with match**  
Filters documents in an aggregation pipeline
```bash
db.myCollection.aggregate([{ $match: { "age": { $gt: 25 } } }])
```

**Aggregate with sort**  
Sorts documents in an aggregation pipeline
```bash
db.myCollection.aggregate([{ $sort: { "age": -1 } }])
```

**Insert with _id**  
Inserts a document with a specific _id value
```bash
db.myCollection.insertOne({ "_id": "user1", "name": "Jane", "age": 28 })
```

**Find by _id**  
Retrieves a document by its _id
```bash
db.myCollection.findOne({ "_id": "user1" })
```

**Check MongoDB server status**  
Displays server status information
```bash
db.serverStatus()
```
```
