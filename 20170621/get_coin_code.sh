coins='ifc ans xas rio ytc vtc xrp wdc qec zcc fz gooc ltc tfc xpm hlb vrc jbc max mtc nxt pgc eth met plc skt zet dnc lkc lsk xsgs btc ppc blk game ktc bts rss doge etc eac mryc peb'

for coin in $coins; do
    result=`curl -s "https://www.jubi.com/coin/$coin/" | grep iframe`;
    echo $coin $result;
    # break;
done
