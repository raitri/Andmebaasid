CREATE TABLE `Course`(
    `code` VARCHAR(255) NOT NULL,
    `Kirjeldus` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`code`)
);
CREATE TABLE `Group`(
    `code` VARCHAR(255) NOT NULL,
    `Kirjeldus` VARCHAR(255) NOT NULL,
    `Rühmajuhataja` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(`code`)
);
CREATE TABLE `Student`(
    `id` BIGINT UNSIGNED NOT NULL,
    `Eesnimi` VARCHAR(255) NOT NULL,
    `Perekonnanimi` VARCHAR(255) NOT NULL,
    `Grupp` VARCHAR(255) NOT NULL,
    `Sünnikuupäev` DATE NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `Teacher`(
    `id` BIGINT UNSIGNED NOT NULL,
    `Eesnimi` VARCHAR(255) NOT NULL,
    `Perekonnanimi` VARCHAR(255) NOT NULL,
    `Tund` VARCHAR(255) NOT NULL,
    `Sünnikuupäev` DATE NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `Comments`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Õpilase isikukood` BIGINT UNSIGNED NOT NULL,
    `Märkus/kommentaar` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Group` ADD CONSTRAINT `group_rühmajuhataja_foreign` FOREIGN KEY(`Rühmajuhataja`) REFERENCES `Teacher`(`id`);
ALTER TABLE
    `Student` ADD CONSTRAINT `student_grupp_foreign` FOREIGN KEY(`Grupp`) REFERENCES `Group`(`code`);
ALTER TABLE
    `Comments` ADD CONSTRAINT `comments_Õpilase isikukood_foreign` FOREIGN KEY(`Õpilase isikukood`) REFERENCES `Student`(`id`);
ALTER TABLE
    `Teacher` ADD CONSTRAINT `teacher_tund_foreign` FOREIGN KEY(`Tund`) REFERENCES `Course`(`code`);