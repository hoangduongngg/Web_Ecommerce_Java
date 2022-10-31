CREATE DEFINER=`root`@`localhost` PROCEDURE `checkLogin`(IN usr VARCHAR(255), IN pwd VARCHAR(255))
Begin
	SELECT * FROM tblMember
    WHERE username = usr AND password = pwd;
end