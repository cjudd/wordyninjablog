CREATE TABLE post (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  content varchar(5000) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  title varchar(500) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE role (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  description varchar(500) NOT NULL,
  name varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE user (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE user_role (
  user_id bigint(20) NOT NULL,
  role_id bigint(20) NOT NULL,
  PRIMARY KEY (user_id,role_id),
  KEY FK_it77eq964jhfqtu54081ebtio (role_id),
  CONSTRAINT FK_apcc8lxk2xnug8377fatvbn04 FOREIGN KEY (user_id) REFERENCES user (id),
  CONSTRAINT FK_it77eq964jhfqtu54081ebtio FOREIGN KEY (role_id) REFERENCES role (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;