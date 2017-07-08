function run()
{
   price=`cat ./price.data`;
   price=`printf "%.4f" $price`
   echo '上一次交易价格：'$price;

   new_price=`curl -s https://www.btctrade.com/doge/ | grep "rate-doge" | grep -E -o "[01-9.]+"`
   new_price=`printf "%.4f" $new_price`
   echo "最新交易价格："$new_price;

   if [[ $new_price != $price ]]; then
       if [[ $new_price > $price ]]; then
           mark="⏫"
       else
           mark="⏬"
       fi

       `echo $new_price > ./price.data`;

       cnt_price=`echo "$new_price*1444054"|bc`

       cnt_price=`printf "%.f" $cnt_price`

       echo "资产："$cnt_price;

       osascript -e 'display notification "'$new_price'" with title "🐶    '$cnt_price'    '$mark'"'
   fi
}


function growth()
{
   new_price=`curl -s https://www.btctrade.com/doge/ | grep "rate-doge" | grep -E -o "[01-9.]+"`
   new_price=`printf "%.4f" $new_price`
   echo "最新交易价格："$new_price;

   if [[ $new_price != $price ]]; then
       if [[ $new_price > $price ]]; then
           mark="⏫"
       else
           mark="⏬"
       fi

       `echo $new_price >> ./growth.data`;

       cnt_price=`echo "$new_price*1444054"|bc`

       cnt_price=`printf "%.f" $cnt_price`

       echo "资产："$cnt_price;

       osascript -e 'display notification "'$new_price'" with title "🐶    '$cnt_price'    '$mark'"'
   fi
}




while [ true ]; do
/bin/sleep 1
run
done
