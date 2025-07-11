CLASS zcl_generated_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generated_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  " delete existing entries in the database table
     DELETE FROM ztravel_rav.   "#EC CI_NOWHERE.
     DELETE FROM zbook_rav.

     " insert travel demo data
     INSERT ztravel_rav FROM (
         SELECT
           FROM /dmo/travel
           FIELDS
             uuid(  )      AS travel_uuid           ,
             travel_id     AS travel_id             ,
             agency_id     AS agency_id             ,
             customer_id   AS customer_id           ,
             begin_date    AS begin_date            ,
             end_date      AS end_date              ,
             booking_fee   AS booking_fee           ,
             total_price   AS total_price           ,
             currency_code AS currency_code         ,
             description   AS description           ,
             CASE status
               WHEN 'B' THEN 'A' " accepted
               WHEN 'X' THEN 'X' " cancelled
               ELSE 'O'          " open
             END           AS overall_status        ,
             createdby     AS created_by            ,
             createdat     AS created_at            ,
             lastchangedby AS last_changed_by       ,
             lastchangedat AS last_changed_at       ,
             lastchangedat AS local_last_changed_at
             ORDER BY travel_id UP TO 200 ROWS
       ).
     COMMIT WORK.

     " insert booking demo data
     INSERT zbook_rav FROM (
         SELECT
           FROM   /dmo/booking    AS booking
             JOIN ztravel_rav AS z
             ON   booking~travel_id = z~travel_id
           FIELDS
             uuid( )                 AS booking_uuid          ,
             z~travel_uuid           AS travel_uuid           ,
             booking~booking_id      AS booking_id            ,
             booking~booking_date    AS booking_date          ,
             booking~customer_id     AS customer_id           ,
             booking~carrier_id      AS carrier_id            ,
             booking~connection_id   AS connection_id         ,
             booking~flight_date     AS flight_date           ,
             booking~flight_price    AS flight_price          ,
             booking~currency_code   AS currency_code         ,
             z~created_by            AS created_by            ,
             z~last_changed_by       AS last_changed_by       ,
             z~last_changed_at       AS local_last_changed_by
       ).
     COMMIT WORK.

     out->write( 'Travel and booking demo data inserted.' ).
          out->write( 'Travel and booking demo data inserted.' ).
  ENDMETHOD.
ENDCLASS.
