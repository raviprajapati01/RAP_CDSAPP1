@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption view for booking'
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity zc_booking_rav as projection on zi_book_rav as Booking
{
    key BookingUuid,
    TravelUuid,
    @Search.defaultSearchElement: true
    BookingId,
    BookingDate,
    @ObjectModel.text.element: ['CustomerName']
    @Search.defaultSearchElement: true
    CustomerId,
    _Customer.LastName as CustomerName,
    @ObjectModel.text.element: ['CarrierName']
    CarrierId,
    _Carrier.Name as CarrierName,
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    CreatedBy,
    LastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    _Travel: redirected to parent zc_travrel_rav,
    _Carrier,
    _Connection,
    _Flight
}
