# MongoDB

MongoDB is a source-available cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.


## Commands

```


# Enumerate users in a database
db.admin.find()
# from HTB "Unified" starting point machine
mongo --port 27117 ace --eval "db.admin.find().forEach(printjson);"


# update users
db.admin.update()

mongo --port 27117 ace --eval 'db.admin.update({"_id":
ObjectId("61ce278f46e0fb0012d47ee4")},{$set:{"x_shadow":"[NEW HASH]"}})'





```