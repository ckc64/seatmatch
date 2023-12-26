import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TicketMasterGenreEventsCall {
  static Future<ApiCallResponse> call({
    String? ticketmasterID = '',
    String? param = '',
    String? equals = '',
    String? geoPoint = '40.7250082,-73.9485209',
    String? startDateTime = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TicketMaster Genre Events',
      apiUrl:
          'https://app.ticketmaster.com/discovery/v2/events?apikey=GzT5SKHZN2fISjwHwMqejDmL35CJgRya&locale=*&startDateTime=$startDateTime&sort=date,asc&countryCode=US&geoPoint=$geoPoint&$param$equals$ticketmasterID&preferredCountry=us',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? events(dynamic response) => getJsonField(
        response,
        r'''$[*].events[:]''',
        true,
      ) as List?;
}

class TicketMasterEventDetailsCall {
  static Future<ApiCallResponse> call({
    String? eventID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TicketMaster Event Details',
      apiUrl:
          'https://app.ticketmaster.com/discovery/v2/events/$eventID?apikey=GzT5SKHZN2fISjwHwMqejDmL35CJgRya&locale=*',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? eventName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  static String? eventID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? eventURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  static String? eventImageURL(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.images[0].url''',
      ));
  static String? eventVenue(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$._embedded.venues[0].name''',
      ));
  static String? eventDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.dates.start.localDate''',
      ));
  static String? eventInfo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info''',
      ));
}

class TicketMasterAllEventsWithPaginationCall {
  static Future<ApiCallResponse> call({
    int? page,
    int? size,
    String? geoPoint = '40.7250082,-73.9485209',
    String? startDateTime = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TicketMaster All Events with Pagination',
      apiUrl:
          'https://app.ticketmaster.com/discovery/v2/events?apikey=GzT5SKHZN2fISjwHwMqejDmL35CJgRya&radius=25&unit=miles&locale=*&startDateTime=$startDateTime&size=$size&page=$page&sort=date,asc&countryCode=US&geoPoint=$geoPoint&preferredCountry=us',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? eventsAll(dynamic response) => getJsonField(
        response,
        r'''$[*].events[:]''',
        true,
      ) as List?;
  static List? eventGenre(dynamic response) => getJsonField(
        response,
        r'''$._embedded.events[:].products[:].classifications[:].genre.id''',
        true,
      ) as List?;
  static dynamic eventVenue(dynamic response) => getJsonField(
        response,
        r'''$._embedded.events[:]._embedded.venues[:].name''',
      );
}

class TicketMasterAllEventsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Ticket Master All Events',
      apiUrl:
          'https://app.ticketmaster.com/discovery/v2/events?apikey=GzT5SKHZN2fISjwHwMqejDmL35CJgRya&locale=*&countryCode=US&preferredCountry=us',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
