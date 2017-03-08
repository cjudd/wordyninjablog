INSERT INTO `post` VALUES (1,'But Groovy is Better.','2015-07-21 00:33:46','Java Rocks!!!');

INSERT INTO `role` VALUES (1,'Standard User','ROLE_USER'),(2,'Blogger User','ROLE_BLOGGER'),(3,'Admin User','ROLE_ADMIN');

INSERT INTO `user` VALUES (1,'Super','Administrator','c93ccd78b2076528346216b3b2f701e6','admin'),(2,'Blogger1','Blogger1','fada6fe346baf66f53eaf4e05fedf662','blogger1'),(3,'Blogger2','Blogger2','fada6fe346baf66f53eaf4e05fedf662','blogger2'),(4,'Reader1','Reader1','721ab316eb0233a02ae8f4ccec08d8b8','reader1'),(5,'Reader2','Reader2','721ab316eb0233a02ae8f4ccec08d8b8','reader2');

INSERT INTO `user_role` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(1,3);
