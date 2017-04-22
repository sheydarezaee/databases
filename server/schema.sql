CREATE DATABASE ourChat;

USE ourChat;

CREATE TABLE users (
  id              	INT NOT NULL, 
  name		        VARCHAR(150) NOT NULL,                
  PRIMARY KEY     (id) 
);


CREATE TABLE messages (
  id              	INT NOT NULL, 
  message           VARCHAR(150) NOT NULL,                
  user_id           INT NOT NULL,                
  FOREIGN KEY (user_id) REFERENCES users(id),
  PRIMARY KEY     (id)                             
);

/* Create other tables and define schemas for them here! */

CREATE TABLE rooms (
  id              	INT NOT NULL, 
  roomName          VARCHAR(150) NOT NULL,                
  user_id           INT NOT NULL, 
  message_id		INT NOT NULL,
  FOREIGN KEY (message_id) REFERENCES messages(id),               
  FOREIGN KEY (user_id) REFERENCES users(id),
  PRIMARY KEY     (id) 
);

CREATE TABLE perMessage (
  id              	INT NOT NULL, 
  message_id		INT NOT NULL,
  room_id          	INT NOT NULL,                
  user_id           INT NOT NULL, 
  FOREIGN KEY (message_id) REFERENCES messages(id),               
  FOREIGN KEY (room_id) REFERENCES rooms(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  PRIMARY KEY     (id)
);



/*  Execute this file from the command line by typing:
 *    mysql -u root -p < server/schema.sql
 *  to create the database and the tables.*/

