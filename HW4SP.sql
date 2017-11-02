CREATE OR REPLACE FUNCTION HW4SP() RETURNS refcursor AS $$
  DECLARE
    ref1 refcursor;                             
  BEGIN
    OPEN ref1 FOR 
      SELECT 
	      Distinct carrier.unique_carrier_name AS "Airline name",
    	  COUNT(flight.flight_id) AS "Total number of flights",
   	    ROUND(AVG(flight.distance),0) AS "Average distance",
    	  SUM(flight.passengers)/SUM(flight.distance) AS "Ratio of passengers to distance",
    	  SUM(flight.freight)/SUM(flight.distance) AS "Ratio of freight to distance",
        CORR(flight.passengers , flight.freight) AS "Corr for passengers to freight",
    	  CORR(flight.passengers , flight.distance) AS "Corr for passengers to distance"
      FROM maintable 
	      inner join carrier ON carrier.Unique_carrier_entity = maintable.Unique_carrier_entity
   	    inner join flight on flight.flight_id = maintable.flight_id
      group by carrier.unique_carrier_name
      order by carrier.unique_carrier_name;
    RETURN ref1;                                                                             
  END;
$$ LANGUAGE plpgsql;

BEGIN;
   SELECT HW4SP();
   FETCH ALL IN "<unnamed portal 1>";
END;
