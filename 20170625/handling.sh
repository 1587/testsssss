jubi_price=1.2;#`curl -s https://www.jubi.com/api/v1/ticker?coin=doge | jq '.last'`;
echo $jubi_price;


btc_price=2;#`curl -s https://api.btctrade.com/api/ticker?coin=doge | jq '.last'`;
echo $btc_price;


diff_price=`echo $btc_price-$jubi_price|bc`;

echo $diff_price;
