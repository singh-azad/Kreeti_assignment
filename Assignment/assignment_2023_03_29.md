# Question 1

What is the main difference between SQL and NoSQL databases?

## Answer

`SQL` => 
1. SQL databases are based on the relational data model, where data is organized into tables with predefined columns and relationships between tables.
2. SQL databases have a rigid schema schema need to defined
before inserting data.
3. SQL databases are vertically scalable.It means that SQL databases can be scaled up by adding more hardware resources such as RAM or CPU power.

`NoSQL` =>
1. NoSQL databases have different data models such as document-based, key-value, graph-based, column orriented.
2. NoSQL databases have a flexible schema where data can be added without any predefined structure. This helps in easy scalability.
3. NoSQL databases are horizontally scalable, meaning that they can be scaled out by adding more servers to a distributed cluster.

# Question 2

What are some of the benefits of using NoSQL databases over
traditional SQL databases?

## Answer

The benefits of using NoSQL databases over RDBMS are:

1. NoSQL databases make it very easy to work with various data formats like JSON, XML, various binary objects, and so on.

2. NoSQL databases have a flexible schema that allows to store different types of data together without a predefined structure. 

3.  NoSQL databases are usefull for high performance and can handle large volumes of data.

4. NoSQL databases are designed to scale horizontally by adding more  servers to a distributed cluster. This allows them to handle massive amounts of data and traffic more easily.

# Question 3

What are some common use cases for NoSQL databases?

## Answer

Some of the common use cases for NoSQL databases are:

1. Internet of Things (IoT) and sensor data.

2. Messaging applications.

3. Content mnagement system.

4. Gaming.

# Question 4

What are the four main types of NoSQL databases, and what are
their key characteristics?

## Answer

1. Document databases

   A document database stores data in JSON, BSON, or XML documents. These formats can be
   used easily in applications. They have become popular because they aid in developer
   productivity because developers can easily change the document to suit the business
   needs.

2. Key-value stores

   In this type of a NoSQL database, all data elements are stored as key-value pairs
   with an attribute and the corresponding value.Key-value databases are highly scalable
   and can handle millions of operations per second with low latency.

3. Column-oriented databases

   These databases store data as columns rather than rows and are optimized for
   read-heavy workloads. Each column is usually of the same type and benefit 
   from data compression. This helps in decision-making as we can run data-analytics
   on the columns directly without having to retrieve unnecessary data.

4. Graph databases

   In graph databses, each element is stored as a node and the relationship between
   nodes are modelled as the links of a graph data structure. They are optimized
   to capture the complex relationships between data elements and can express them
   easily as compated to RDBMS.

# Question 5

What is the CAP theorem, and how does it relate to distributed
systems?

## Answer

CAP theorem: A distributed system can deliver only two of three desired characteristics: **consistency**, **availability**,
and **partition tolerance**.In the presence of a network partition or a failure , distributed
system must chose between **consistency** and **availability**.It is not possible to maintain both
of them.

A distributed system is a collection of independent systems that work together as a single system.
Let's assume a distributed database is replicated across multiple data centers.
If a network partition occurs that separates the data centers, the system must choose whether to prioritize consistency or availability. If it prioritizes consistency, it may not be able to provide updates to users until the partition is resolved. On the other hand, if it prioritizes availability, it may allow updates to be made but may risk data inconsistency between the data centers.

.

# Question 6

What are the three properties of the CAP theorem?

## Answer

1. Consistency

   Consistency refers to the requirement that all clients observe identical data simultaneously, regardless of the node they connect to. In order to achieve this, any data written to one node must be replicated to all other nodes in the system before considering the write as successful.

2. Availability

   Availability ensures that every client requesting data receives a response, even if one or more nodes in the system are unavailable. In other words, all operational nodes in the distributed system consistently provide a valid response for any request, without exceptions.

3. Partition tolerance

   A partition in a distributed system refers to a communication breakdown between nodes, resulting in lost or temporarily delayed connections. Partition tolerance denotes the system's ability to continue functioning effectively, even in the presence of such communication failures between nodes, ensuring reliable operation despite potential disruptions.

# Question 7

What are the BASE properties, and how do they relate to the CAP
theorem?

## Answer

The BASE properties are a set of principles that are associated with NoSQL databses just like ACID
properties are associated with with SQL Databases.

1. Basically Available

   This means that the system remains operational and responsive to client requests, even in the presence of failures. It does not necessarily guarantee strict consistency or immediate availability of data, but rather focuses on providing acceptable availability levels.

2. Soft-state

   This means that the state of the system can evolve over time, and there may be temporary inconsistencies or conflicts in data, especially in distributed or replicated systems.

3. Eventually Consistent

   This means that the system eventually reaches a consistent state, but there may be temporary inconsistencies or conflicts in data that are eventually resolved without blocking client operations.

In relation to the CAP theorem, the BASE properties are aligned with the idea of prioritizing Availability and Partition Tolerance over strict Consistency in distributed systems. This means that in a distributed system that adheres to the BASE properties, it may sacrifice strong Consistency in favor of providing acceptable Availability and Partition Tolerance, which aligns with the trade-offs presented by the CAP theorem.