-module(dealership).

-export([list_prices/1]).

list_prices(Currency) ->
    CarList = get_car_list(),
    print_price(CarList, Currency).

% Get car list      
get_car_list() ->
    ["BMW i8", "Lamborghini Huracan", "Ferrari f12"].

% Get car map
get_car_map() -> 
    #{"BMW i8" => 150000, "Lamborghini Huracan" => 500000, "Ferrari f12" => 700000}.

% Convert to correct currency 
convert_price(Price, Currency) ->
    case Currency of
        eur -> round(Price * 0.9);
        gbp -> round(Price * 0.5);
        usd -> Price
    end.

% stop condition for when the list is empty
print_price([], Currency) ->
    true;
% Print the prices for the car list and convert to the correct currency
print_price([Car | Rest], Currency) -> 
    % Get cars and prices
    CarMap = get_car_map(),
    Price = maps:get(Car, CarMap),
    ConvertedPrice = convert_price(Price, Currency),
    % Print price
    io:fwrite(Car ++ ": " ++ integer_to_list(ConvertedPrice) ++ "\n"),
    % Recursive call
    print_price(Rest, Currency).
