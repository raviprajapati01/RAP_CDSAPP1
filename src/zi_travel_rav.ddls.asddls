@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for travel'
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity zi_travel_rav as select from ztravel_rav as _Travel
composition[0..*] of zi_book_rav as _BOOKING
association[0..1] to /DMO/I_Agency as _AGENCY on $projection.AgencyId = _AGENCY.AgencyID
association[0..1] to /DMO/I_Customer as _CUSTOMER on $projection.CustomerId = _CUSTOMER.CustomerID
association[0..1] to I_Currency as _CURRENCY on $projection.CurrencyCode = _CURRENCY.CurrencyISOCode
//association[0..1] to /dmo/o
{
   key travel_uuid as TravelUuid,
   travel_id as TravelId,
   agency_id as AgencyId,
   customer_id as CustomerId,
   begin_date as BeginDate,
   end_date as EndDate,
   currency_code as CurrencyCode,
   @Semantics.amount.currencyCode: 'CurrencyCode'
   booking_fee as BookingFee,
   @Semantics.amount.currencyCode: 'CurrencyCode'
   total_price as TotalPrice,
   
   description as Description,
   overall_status as OverallStatus,
   created_by as CreatedBy,
   created_at as CreatedAt,
   last_changed_by as LastChangedBy,
   last_changed_at as LastChangedAt,
   local_last_changed_at as LocalLastChangedAt,
   
   _BOOKING,
   _AGENCY,
   _CUSTOMER,
   _CURRENCY
}
