DROP DATABASE IF EXISTS lesson_6_hm;
CREATE DATABASE lesson_6_hm;
USE lesson_6_hm;

/* 1.
Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER //

CREATE FUNCTION IntToTime (second_value BIGINT)
RETURNS TINYTEXT

BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;

    SET days = second_value DIV (24 * 3600);
    SET hours = second_value MOD (24 * 3600) DIV 3600 ;
    SET minutes = second_value MOD 3600 MOD 3600 DIV 60;
    SET seconds = second_value MOD 3600 MOD 3600 MOD 60;

   RETURN CONCAT(second_value,' -> ',days," days ",hours," hours ",minutes," minutes ",seconds," seconds ");

END//

DELIMITER ;

SELECT IntToTime(450305);

/* 2.
Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/

DELIMITER //

CREATE PROCEDURE EvenInNumber(number_value INT)
BEGIN
    DECLARE even_value INT;
    SET even_value = 1;
    WHILE even_value <= number_value DO
        IF even_value MOD 2 = 0 THEN SELECT even_value;
        END IF;
        SET even_value = even_value + 1;
    END WHILE;
END//

DELIMITER ;

CALL EvenInNumber(10);
