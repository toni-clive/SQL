# [Practical SQL: A Beginner's Guide to Storytelling with Data](https://practicalsql.com/)

Notes for useful info I've picked up from the book

## Chapter 1 

Includes links Github repo for ahead, also includes the following IDE recommendations,Postgres link/setup and PGadmin.

Instructions are provided for the setup of Postgres & PGadmin.

Creating Servers are also mentioned should PGadmin not have a default one 

Right click on the Server > Create Server 
Fill in the following fields name in the General Tab.
On the Connections tab enter localhost  for host name/address box also provide the username and password from PostgreSQL then save. The server should be listed.
The server contains a collection of objects every defines every feature of the database server. Most importantly it contains tables which we can write queries on to investigate data.

The query tool can be selected by Tools > Query Tool note that you need to have a database selected.

Query to check the version of SQL being ran, seems compatible with MYSQL also.
SELECT version();