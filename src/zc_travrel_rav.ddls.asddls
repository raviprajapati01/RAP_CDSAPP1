@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption view for travel'
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity zc_travrel_rav as projection on zi_travel_rav
{
    key TravelUuid,
    @Search.defaultSearchElement: true
    TravelId,
    @ObjectModel.text.element: ['AgencyName']
    @Search.defaultSearchElement: true
    AgencyId,
    _AGENCY.Name as AgencyName,
    @Search.defaultSearchElement: true
    @ObjectModel.text.element: ['AgencyName']
    CustomerId,
    BeginDate,
    EndDate,
    CurrencyCode,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _AGENCY,
    _BOOKING: redirected to composition child zc_booking_rav,
    _CURRENCY,
    _CUSTOMER
}
