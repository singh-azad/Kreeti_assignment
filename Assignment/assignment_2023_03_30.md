# Question 1

What are the main features of redis?

## Answer

The main features of Redis are:

1. In-memory database:

    Because of it is architecture and like most in-memory databases, Redis is Lightening fast. Redis is a high performance database that can be scaled easily and serve a large number of requests per second.

2. Data structures:

   Redis supports a rich set of data structures, including strings, lists, sets, sorted sets, and hashes.

3. TTL: 

    Redis provides support for TTL on keys,
    which allows to set an expiration time for a key, after which it will automatically be removed from the database.

# Question 2

Write down the limitations of redis?

## Answer

1. Memory limit:

    Redis is an in-memory database, which means that the whole dataset is stored in the memory (RAM). Whish is costly.

2. Query Language:

    Redis doesn't support any query language (only commands are used).

3. Security:

    Redis supports only basic security options. Redis doesn't provide any access control.

# Question 3

Perform a basic CRUD operation using redis.

## Answer

1. Create key

   ```
   SET my_name 'Azad Singh'
   ```

2. Read key

   ```
   GET my_name
   ```

3. Update key

   ```
   SET my_name 'Azad'
   ```

4. Delete key

   ```
   DEL my_name
   ```

# Question 4

Explain TTL command with an example.

## Answer

TTL (Time-To-Live) is use to check remaining time to live of a key( key will be deleted automatically from the database).

```
SET age '22'

EXPIRE age 10
```

`age` will now hava TTL of 10 seconds after which it will be deleted from the database.

We can use `ttl` to check how much time `age` has till it expires.

```
TTL age
```

# Question 5

Create a transaction in redis to perform the following operations.

- Create two keys in a single line and one key differently. (one value
should be number)

- Read any two value in a single line

- Increment the number value

- Expire any two keys after some time

## Answer

```
MULTI
MSET fname "azad" lname "singh"
SET age 22
MGET fname lname
INCR age
EXPIRE fname 100
EXPIRE age 44
EXEC
```