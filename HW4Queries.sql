1.
Select city_name,state_nm,origin_destination,unique_carrier_name,passengers
from Maintable inner join carrier ON carrier.Unique_carrier_entity = Maintable.Unique_carrier_entity
Inner join airport on airport.airport_id = maintable.origin_airport_id
inner join flight on flight.flight_id = maintable.flight_id
where Airport.State_abr = 'CO'
order by unique_carrier_name;

2.
Select city_name,state_nm,origin_destination,unique_carrier_name,freight
from Maintable inner join carrier ON carrier.Unique_carrier_entity = Maintable.Unique_carrier_entity
Inner join airport on airport.airport_id = maintable.origin_airport_id
inner join flight on flight.flight_id = maintable.flight_id
where Airport.State_abr = 'CO' and flight.freight != 0
order by unique_carrier_name;

3.
Select A.city_name, B.city_name, unique_carrier_name, passengers
from Maintable inner join carrier ON carrier.unique_carrier_entity = maintable.unique_carrier_entity
inner join airport A on A.airport_id = maintable.origin_airport_id
inner join airport B on B.airport_id = maintable.dest_airport_id
inner join flight on flight.flight_id = maintable.flight_id
where A.State_abr != 'CO' and B.State_abr = 'CO'
order by unique_carrier_name;

4.
Select B.city_name, unique_carrier_name
from Maintable inner join carrier ON carrier.unique_carrier_entity = maintable.unique_carrier_entity
inner join airport A on A.airport_id = maintable.dest_airport_id
inner join airport B on B.airport_id = maintable.origin_airport_id
inner join flight on flight.flight_id = maintable.flight_id
where A.city_name = 'Denver, CO' and flight.distance > 500 and flight.distance < 1200
order by unique_carrier_name;
