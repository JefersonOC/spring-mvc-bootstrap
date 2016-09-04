/*All User's gets stored in APP_USER table*/
create table APP_USER (
   id SERIAL NOT NULL,
   sso_id VARCHAR(80) NOT NULL,
   password VARCHAR(100) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(80) NOT NULL,
   email VARCHAR(200) NOT NULL,
   state VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (sso_id)
);

/* USER_PROFILE table contains all possible roles */
create table USER_PROFILE(
   id SERIAL NOT NULL,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);

/* JOIN TABLE for MANY-TO-MANY relationship*/
CREATE TABLE APP_USER_USER_PROFILE (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILE (id)
);

/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILE(type)
VALUES ('USER');

INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');

INSERT INTO USER_PROFILE(type)
VALUES ('MANAGER');


/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO APP_USER(sso_id, password, first_name, last_name, email, state)
VALUES ('admin','$2a$10$7mZYLKnXS/HLPyhEKDfZsOQkeThutPDiTL2MsxI4Dv4yK.tVDi2Pe', 'Jeferson','Cruz','jeferson.cruz@xyz.com', 'Active');


/* Populate JOIN Table */
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT usr.id, profile.id FROM app_user usr, user_profile profile
  where usr.sso_id='admin' and profile.type='ADMIN';