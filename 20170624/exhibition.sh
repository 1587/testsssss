
# echo '印象派   莫奈 塞尚  梵高   文艺复兴 杨丽萍

# 文艺复兴三杰 但丁 彼特拉克 薄伽丘'


# 清华展厅

# 中国美院展厅

# 中央美院展厅
#
function run(){
    echo 'curl --> '$1;
    content=`curl -s $1 | grep -o -e '印象派' -e '莫奈' -e '塞尚' -e '梵高' -e '文艺复兴' -e '杨丽萍' -e '三杰' -e '但丁' -e '彼特拉克' -e '薄伽丘'`;
    echo $content;
}


urls="http://www.namoc.org/zsjs/zlzx/
http://www.namoc.org/zsjs/zlzx/
https://beijing.douban.com/events/future-exhibition
https://beijing.douban.com/events/future-exhibition?start=10
https://beijing.douban.com/events/future-exhibition?start=20
https://search.damai.cn/search.html?keyword=%E7%94%BB%E5%B1%95
http://www.art-eshow.com/
http://news.baidu.com/ns?cl=2&rn=20&tn=news&word=%20%E7%94%BB%E5%B1%95
http://news.baidu.com/ns?word=%E7%94%BB%E5%B1%95&pn=20&cl=2&ct=1&tn=news&rn=20&ie=utf-8&bt=0&et=0
http://www.youhuaaa.com/page/exhibition/
http://www.artx.cn/exhibit/beijing.html
http://www.takefoto.cn/category/art/huazhan
https://www.toutiao.com/search/?keyword=%E7%94%BB%E5%B1%95
";

for url in $urls; do
    run $url;
done

