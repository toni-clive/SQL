-- https://pgexercises.com/questions/date/utilisationpermonth.html

with business_month as (select 	date_trunc('month', cal.month) as month,
	EXTRACT(day FROM (cal.month + interval '1 month') - cal.month)*(25) as slots_available
	from
	(
		select generate_series(( SELECT MIN(starttime) FROM cd.bookings),
          (SELECT MAX(starttime) + interval '1 month' FROM cd.bookings), interval '1 month') as month
	) cal
order by month),

slots as( SELECT f.name,DATE_TRUNC('month',  starttime) AS month,SUM(slots) AS s FROM cd.bookings b JOIN cd.facilities f
ON b.facid = f.facid
group by b.facid,f.name,DATE_TRUNC('month',  starttime) order by b.facid,month)

SELECT slots.name,slots.month, ROUND(100*(slots.s/business_month.slots_available),1) utilisation FROM slots JOIN business_month on slots.month = business_month.month
 ORDER BY slots.name,slots.month