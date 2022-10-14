CLASS zcl_rap_eml_zthe DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_zthe IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " step 1 - READ
* Only Key fields are read if no other are specified
*    READ ENTITIES OF ZI_RAP_Travel_ZTHE
*        ENTITY Travel
*            FROM VALUE #( ( TravelUUID = '65152A5016E230371800A6EE979444C6' ) ) "Travel ID 1
*        RESULT DATA(travels).

* specify read fields
*    READ ENTITIES OF ZI_RAP_Travel_ZTHE
*        ENTITY Travel
*        FIELDS ( AgencyID CustomerID )
*            WITH VALUE #( ( TravelUUID = '65152A5016E230371800A6EE979444C6' ) ) "Travel ID 1
*        RESULT DATA(travels).

* Read all fields
*    READ ENTITIES OF ZI_RAP_Travel_ZTHE
*        ENTITY Travel
*        all FIELDS WITH VALUE #( ( TravelUUID = '65152A5016E230371800A6EE979444C6' ) ) "Travel ID 1
*        RESULT DATA(travels).

* read by association
*    READ ENTITIES OF ZI_RAP_Travel_ZTHE
*        ENTITY Travel by \_Booking
*        all FIELDS WITH VALUE #( ( TravelUUID = '65152A5016E230371800A6EE979444C6' ) ) "Travel ID 1
*        RESULT DATA(travels).

*read uuid that does not exist
*    READ ENTITIES OF ZI_RAP_Travel_ZTHE
*        ENTITY Travel
*        all FIELDS WITH VALUE #( ( TravelUUID = 'AAAAAAAAAA' ) ) "Travel ID 1
*        RESULT DATA(travels)
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed-travel[ 1 ]-%fail-cause ).
*    out->write( reported ).

*Modifying operations
*    MODIFY ENTITIES OF ZI_RAP_Travel_ZTHE
*        ENTITY Travel
*            UPDATE
*                SET FIELDS WITH VALUE
*                #( (  TravelUUID = '65152A5016E230371800A6EE979444C6'
*                      Description = 'I like RAP@openSAP') )
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*" Hint you must commit your changes to be propagated to the database
*COMMIT ENTITIES
*    RESPONSE OF ZI_RAP_Travel_ZTHE
*        FAILED DATA(failed_commit)
*        REPORTED DATA(reported_commit).

*Create new record
*    MODIFY ENTITIES OF ZI_RAP_Travel_ZTHE
*        ENTITY Travel
*        CREATE
*        SET FIELDS WITH VALUE
*         #( ( %cid        = 'MyContentID_1'
*                     AgencyID    = '70012'
*                     CustomerID  = '14'
*                     BeginDate   = cl_abap_context_info=>get_system_date( )
*                     EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                     Description = 'I like RAP@openSAP' ) )
*
*         MAPPED DATA(mapped)
*         FAILED DATA(failed)
*         REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_Travel_ZTHE
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).

    " step 8 - MODIFY Delete
    MODIFY ENTITIES OF ZI_RAP_Travel_ZTHE
      ENTITY travel
        DELETE FROM
          VALUE
            #( ( TravelUUID  = '6ED48F210DBC1EED92F323964C97E93C' ) )

     FAILED DATA(failed)
     REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF ZI_RAP_Travel_zthe
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Delete done' ).

  ENDMETHOD.
ENDCLASS.
