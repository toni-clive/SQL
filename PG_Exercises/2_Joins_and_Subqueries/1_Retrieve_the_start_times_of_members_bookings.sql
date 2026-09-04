-- https://pgexercises.com/questions/joins/simplejoin.html

select bks.starttime
        from
                cd.bookings bks
        JOIN
                cd.members mems
        ON mems.memid = bks.memid;
        
        where
                mems.firstname='David'
                and mems.surname='Farrell'
                

select bks.starttime
        from
                cd.bookings bks,
                cd.members mems
        where
                mems.firstname='David'
                and mems.surname='Farrell'
                and mems.memid = bks.memid;