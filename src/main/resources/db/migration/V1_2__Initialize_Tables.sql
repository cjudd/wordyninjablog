INSERT INTO `post` VALUES (1,'But Groovy is Better.','2015-07-21 00:33:46','Java Rocks!!!');

INSERT INTO `role` VALUES (1,'Standard User','ROLE_USER'),(2,'Blogger User','ROLE_BLOGGER'),(3,'Admin User','ROLE_ADMIN');

INSERT INTO `user` VALUES (1,'Super','Administrator','{md5}{ioO2VnE1x/l/8Ah+8UqVaF3JotkOmlVg9wD1GfOcPLk=}2d75002e994ed52f71db5be9d867ae5a','admin'),(2,'Blogger1','Blogger1','{md5}{beraozgJzxVYCRTFik5dxx9fNNqv9S4jh1IPKieF//8=}31014a3c56c616be865758bfcbc791b3','blogger1'),(3,'Blogger2','Blogger2','{md5}{htFHn5FN0U77Glf5EWrWXh7LH04s3frqRkmfE2Un/MA=}fa317679aa307fcf177ee2672efe72e1','blogger2'),(4,'Reader1','Reader1','{md5}{AkqLFUOUB4WeZwj2dbxH7aHukkzwzgL2t5G2upbzDBU=}196113ea0fdc17627cdafdccd7410a62','reader1'),(5,'Reader2','Reader2','{md5}{XvOPoC8P8b2ouSAzMGt5j/UmKzo29b0GzhsxQM6KiDg=}be7d2394597ee39b38b18e84436a07fc','reader2');

INSERT INTO `user_role` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(1,3);
