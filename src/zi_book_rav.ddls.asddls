@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for booking'

define view entity zi_book_rav as select from zbook_rav as booking
association to parent ZI_TRAVEL_RAV as _Travel on $projection.TravelUuid = _Travel.TravelUuid
 association [1..1] to /DMO/I_Customer           as _Customer   on  $projection.CustomerId   = _Customer.CustomerID
   association [1..1] to /DMO/I_Carrier            as _Carrier    on  $projection.CarrierId    = _Carrier.AirlineID
   association [1..1] to /DMO/I_Connection         as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                                  and $projection.ConnectionId = _Connection.ConnectionID
   association [1..1] to /DMO/I_Flight             as _Flight     on  $projection.CarrierId    = _Flight.AirlineID
                                                                  and $projection.ConnectionId = _Flight.ConnectionID
                                                                  and $projection.FlightDate   = _Flight.FlightDate
   association [0..1] to I_Currency                as _Currency   on $projection.CurrencyCode    = _Currency.Currency    
{
    key booking_uuid as BookingUuid,
    travel_uuid as TravelUuid,
    booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    created_by as CreatedBy,
    last_changed_by as LastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    
    _Travel,
    _Customer,
    _Carrier,
    _Connection,
    _Flight,
    _Currency
}
