CREATE DATABASE latihan1
USE latihan1

CREATE TABLE Users(
	users_id CHAR(10),
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255),
	gender VARCHAR(255) NOT NULL,
	users_location VARCHAR(255) NOT NULL,
	users_birth_date DATE NOT NULL,
	users_address VARCHAR(255) NOT NULL,
	users_school VARCHAR(255),
	users_email VARCHAR(255) NOT NULL,
	users_phone_number VARCHAR(255) NOT NULL

	CONSTRAINT Users_PK PRIMARY KEY(users_id),

	CONSTRAINT Users_Check_ID CHECK(users_id LIKE 'AAA-A[0-9][0-9]-[0-9][0-9]'),
	CONSTRAINT Users_Check_gender CHECK(gender LIKE 'Male' OR gender LIKE 'Female'),
	CONSTRAINT Users_Check_email CHECK(users_email LIKE '%@%')
)
--DROP TABLE Users
--INSERT INTO Users(users_id, users_email)
--VALUES('AAA-A00-00', '@')

CREATE TABLE Pages(
	pages_id CHAR(5),
	pages_name VARCHAR(255) NOT NULL,
	pages_content VARCHAR(255) NOT NULL

	CONSTRAINT Pages_PK PRIMARY KEY(pages_id),

	CONSTRAINT Pages_check_id CHECK(pages_id LIKE 'PG[0-9][0-9][0-9]')
)
--DROP TABLE Pages

CREATE TABLE Page_Likes(
	pages_id CHAR(5),
	users_id CHAR(10),

	CONSTRAINT Page_Likes_PK PRIMARY KEY(pages_id, users_id),
	CONSTRAINT Page_likes_pages_FK FOREIGN KEY(pages_id) REFERENCES Pages(pages_id)
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	CONSTRAINT Page_likes_users_FK FOREIGN KEY(users_id) REFERENCES Users(users_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)
--DROP TABLE Page_likes

CREATE TABLE Friends(
	friends_id CHAR(10),
	users_id CHAR(10)

	CONSTRAINT Friends_PK PRIMARY KEY(friends_id, users_id),
	CONSTRAINT Friends_users_FK FOREIGN KEY(users_id) REFERENCES Users(users_id)
)
--DROP TABLE Friends

CREATE TABLE Posts(
	posts_id CHAR(5),
	users_id CHAR(10),
	posts_date DATE NOT NULL,
	posts_content VARCHAR(255)

	CONSTRAINT Posts_PK PRIMARY KEY(posts_id),
	CONSTRAINT Users_Posts_FK FOREIGN KEY(users_id) REFERENCES Users(users_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	CONSTRAINT Posts_check_id CHECK(posts_id LIKE 'PO[0-9][0-9][0-9]')
)
--DROP TABLE Posts

CREATE TABLE Post_Likes(
	posts_id CHAR(5),
	users_id CHAR(10)

	CONSTRAINT Post_Likes_PK PRIMARY KEY(posts_id, users_id),
	CONSTRAINT Post_Likes_posts_FK FOREIGN KEY(posts_id) REFERENCES Posts(posts_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT Post_Likes_users_FK FOREIGN KEY(users_id) REFERENCES Users(users_id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
)
--DROP TABLE Post_Likes

CREATE TABLE Photos(
	photo_id CHAR(5),
	posts_id CHAR(5),
	image_content IMAGE,

	CONSTRAINT Photos_PK PRIMARY KEY(photo_id),
	CONSTRAINT Posts_photos_FK FOREIGN KEY(posts_id) REFERENCES Posts(posts_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
)
--DROP TABLE Photos

CREATE TABLE Comments(
	comment_id CHAR(5),
	posts_id CHAR(5),
	users_id CHAR(10),
	comment_date DATE,
	comment_content VARCHAR(255) NOT NULL

	CONSTRAINT Comments_PK PRIMARY KEY(comment_id),
	CONSTRAINT Comments_posts_FK FOREIGN KEY(posts_id) REFERENCES Posts(posts_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT Comments_users_FK FOREIGN KEY(users_id) REFERENCES Users(users_id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
)
--DROP TABLE Comments

CREATE TABLE Comment_Likes(
	comment_id CHAR(5),
	users_id CHAR(10),

	CONSTRAINT Comment_Likes_PK PRIMARY KEY(comment_id, users_id),
	CONSTRAINT Comment_likes_comment_FK FOREIGN KEY(comment_id) REFERENCES Comments(comment_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT Comment_likes_users_FK FOREIGN KEY(users_id) REFERENCES Users(users_id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
)
--DROP TABLE Comment_Likes

CREATE TABLE Shares(
	users_id CHAR(10),
	posts_id CHAR(5),

	CONSTRAINT Shares_PK PRIMARY KEY(users_id, posts_id),
	CONSTRAINT Shares_users_FK FOREIGN KEY(users_id) REFERENCES Users(users_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT Shares_posts_FK FOREIGN KEY(posts_id) REFERENCES Posts(posts_id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
)
--DROP TABLE Shares