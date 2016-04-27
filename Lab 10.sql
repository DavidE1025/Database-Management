
select *
from Prerequisites
order by courseNum DESC;

select * 
from courses
order by num ASC;

--1.) Returns the immediate prequesites for the passed-in course number
CREATE OR REPLACE FUNCTION PreReqsFor(int, REFCURSOR) RETURNS refcursor AS
$$
DECLARE
   course_Num int       :=$1;
   resultset  REFCURSOR :=$2;
BEGIN
  OPEN resultset FOR
      SELECT preReqNum
      FROM Prerequisites
      WHERE courseNum = course_Num;
  RETURN resultset;
END;
$$
LANGUAGE plpgsql;

SELECT PreReqsFor(221, 'result');
FETCH ALL FROM result; 

--2.) Returns the courses for which the passed-in course number is an immediate prereqiuisite
CREATE OR REPLACE FUNCTION IsPreReqFor(int, REFCURSOR) RETURNS refcursor AS
$$
DECLARE
   course_Num int       :=$1;
   resultset  REFCURSOR :=$2;
BEGIN
  OPEN resultset FOR
      SELECT courseNum
      FROM Prerequisites
      WHERE prereqNum = course_Num;
  RETURN resultset;
END;
$$
LANGUAGE plpgsql;

SELECT IsPreReqFor(221, 'result');
FETCH ALL FROM result; 
      