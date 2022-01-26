class FinanceData {
  FinanceData({
    required this.by,
    required this.validKey,
    required this.results,
    required this.executionTime,
    required this.fromCache,
  });

  late String by;
  late bool validKey;
  late Results results;
  late double executionTime;
  late bool fromCache;

  FinanceData.fromJSON(Map<String, dynamic> json) {
    by = json['by'];
    validKey = json['valid_key'];
    results =
        (json['results'] != null ? Results.fromJSON(json['results']) : null)!;
    executionTime = json['execution_time'];
    fromCache = json['from_cache'];
  }

  Map<String, dynamic> json() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['by'] = by;
    data['valid_key'] = validKey;
    data['results'] = results;
    data['execution_time'] = executionTime;
    data['from_cache'] = fromCache;
    return data;
  }
}

class Results {
  late Currencies currencies;
  late Stocks stocks;
  late List<String> availableSources;
  late Bitcoin bitcoin;
  late Taxes taxes;

  Results(
      {required this.currencies,
      required this.stocks,
      required this.availableSources,
      required this.bitcoin,
      required this.taxes});

  Results.fromJSON(Map<String, dynamic> json) {
    currencies = (json['currencies'] != null
        ? Currencies.fromJSON(json['currencies'])
        : null)!;
    stocks = (json['stocks'] != null ? Stocks.fromJson(json['stocks']) : null)!;
    availableSources = List<String>.from(json['available_sources']);
    bitcoin =
        (json['bitcoin'] != null ? Bitcoin.fromJson(json['bitcoin']) : null)!;
    taxes = (json['taxes'] != null ? Taxes.fromJSON(json['taxes']) : null)!;
  }

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['currencies'] = currencies;
    data['stocks'] = stocks;
    data['available_sources'] = availableSources;
    data['bitcoin'] = bitcoin;
    data['taxes'] = taxes;
    return data;
  }
}

class Currencies {
  String? source;
  late CoinISO usd;
  late CoinISO eur;
  late CoinISO gbp;
  late CoinISO ars;
  late CoinISO cad;
  late CoinISO aud;
  late CoinISO jpy;
  late CoinISO cny;
  late CoinISO btc;

  Currencies(
      {required this.source,
      required this.usd,
      required this.eur,
      required this.gbp,
      required this.ars,
      required this.cad,
      required this.aud,
      required this.jpy,
      required this.cny,
      required this.btc});

  Currencies.fromJSON(Map<String, dynamic> json) {
    json['source'] = source;
    usd = (json['USD'] != null ? CoinISO.fromJson(json['USD']) : null)!;
    eur = (json['EUR'] != null ? CoinISO.fromJson(json['EUR']) : null)!;
    gbp = (json['GBP'] != null ? CoinISO.fromJson(json['GBP']) : null)!;
    ars = (json['ARS'] != null ? CoinISO.fromJson(json['ARS']) : null)!;
    cad = (json['CAD'] != null ? CoinISO.fromJson(json['CAD']) : null)!;
    aud = (json['AUD'] != null ? CoinISO.fromJson(json['AUD']) : null)!;
    jpy = (json['JPY'] != null ? CoinISO.fromJson(json['JPY']) : null)!;
    cny = (json['CNY'] != null ? CoinISO.fromJson(json['CNY']) : null)!;
    btc = (json['BTC'] != null ? CoinISO.fromJson(json['BTC']) : null)!;
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source;
    data['USD'] = usd;
    data['EUR'] = eur;
    data['GBP'] = gbp;
    data['ARS'] = ars;
    data['CAD'] = cad;
    data['AUD'] = aud;
    data['JPY'] = jpy;
    data['CNY'] = cny;
    data['BTC'] = btc;
    return data;
  }
}

class CoinISO {
  late String name;
  late double? buy;
  late double? sell;
  late double variation;

  CoinISO({
    required this.name,
    required this.buy,
    required this.sell,
    required this.variation,
  });

  CoinISO.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    buy = json['buy'];
    sell = json['sell'];
    variation = json['variation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['buy'] = buy;
    data['sell'] = sell;
    data['variation'] = variation;
    return data;
  }
}

class Stocks {
  late Index ibovespa;
  late Index ifix;
  late Index nasdaq;
  late Index dowjones;
  late Index cac;
  late Index nikkei;

  Stocks(
      {required this.ibovespa,
      required this.ifix,
      required this.nasdaq,
      required this.dowjones,
      required this.cac,
      required this.nikkei});

  Stocks.fromJson(Map<String, dynamic> json) {
    ibovespa =
        (json['IBOVESPA'] != null ? Index.fromJson(json['IBOVESPA']) : null)!;

    ifix = (json['IFIX'] != null ? Index.fromJson(json['IFIX']) : null)!;

    nasdaq = (json['NASDAQ'] != null ? Index.fromJson(json['NASDAQ']) : null)!;

    dowjones =
        (json['DOWJONES'] != null ? Index.fromJson(json['DOWJONES']) : null)!;

    cac = (json['CAC'] != null ? Index.fromJson(json['CAC']) : null)!;
    nikkei = (json['NIKKEI'] != null ? Index.fromJson(json['NIKKEI']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IBOVESPA'] = ibovespa.toJson();
    data['IFIX'] = ifix.toJson();
    data['NASDAQ'] = nasdaq.toJson();
    data['DOWJONES'] = dowjones.toJson();
    data['CAC'] = cac.toJson();
    data['NIKKEI'] = nikkei.toJson();
    return data;
  }
}

class Index {
  late String name;
  late String location;
  late double points;
  late double variation;

  Index(
      {required this.name,
      required this.location,
      required this.points,
      required this.variation});

  Index.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    points = json['points'];
    variation = json['variation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['location'] = location;
    data['points'] = points;
    data['variation'] = variation;
    return data;
  }
}

class Bitcoin {
  Bitcoin(
      {required this.blockchainInfo,
      required this.coinbase,
      required this.bitstamp,
      required this.foxbit,
      required this.mercadobitcoin});

  late StockBroker blockchainInfo;
  late StockBroker coinbase;
  late StockBroker bitstamp;
  late StockBroker foxbit;
  late StockBroker mercadobitcoin;

  Bitcoin.fromJson(Map<String, dynamic> json) {
    blockchainInfo = (json['blockchain_info'] != null
        ? StockBroker.fromJson(json['blockchain_info'])
        : null)!;

    coinbase = (json['coinbase'] != null
        ? StockBroker.fromJson(json['coinbase'])
        : null)!;

    bitstamp = (json['bitstamp'] != null
        ? StockBroker.fromJson(json['bitstamp'])
        : null)!;

    foxbit =
        (json['foxbit'] != null ? StockBroker.fromJson(json['foxbit']) : null)!;

    mercadobitcoin = (json['mercadobitcoin'] != null
        ? StockBroker.fromJson(json['mercadobitcoin'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['blockchain_info'] = blockchainInfo.toJson();
    data['coinbase'] = coinbase.toJson();
    data['bitstamp'] = bitstamp.toJson();
    data['foxbit'] = foxbit.toJson();
    data['mercadobitcoin'] = mercadobitcoin.toJson();
    return data;
  }
}

class StockBroker {
  StockBroker({
    required this.name,
    this.buy,
    this.sell,
    required this.variation,
  });

  late String name;
  late List<String> format;
  late double? buy;
  late double? sell;
  late double variation;

  StockBroker.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    format = json['format'].cast<String>();
    buy = json['buy'];
    sell = json['sell'];
    variation = json['variation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['format'] = format;
    data['buy'] = buy;
    data['sell'] = sell;
    data['variation'] = variation;
    return data;
  }
}

class Taxes {
  late List<Tax>? taxes;
  Taxes({required this.taxes});

  Taxes.fromJSON(List<dynamic> json) {
    taxes = json.map((e) => Tax.fromJson(e)).toList();
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxes'] = taxes;
    return data;
  }
}

class Tax {
  Tax({
    required this.date,
    required this.cdi,
    required this.selic,
    required this.dailyFactor,
    required this.selicDaily,
    required this.cdiDaily,
  });

  late DateTime date;
  late double cdi;
  late double selic;
  late double dailyFactor;
  late double selicDaily;
  late double cdiDaily;

  Tax.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    cdi = json['cdi'];
    selic = json['selic'];
    dailyFactor = json['daily_factor'];
    selicDaily = json['selic_daily'];
    cdiDaily = json['cdi_daily'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['cdi'] = cdi;
    data['selic'] = selic;
    data['daily_factor'] = dailyFactor;
    data['selic_daily'] = selicDaily;
    data['cdi_daily'] = cdiDaily;
    return data;
  }
}
