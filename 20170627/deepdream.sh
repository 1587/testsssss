for i in {150..160};
do
    curl "https://deepdreamgenerator.com/gallery?time=all&page=$i" >> dream2.log
    echo $i;
done

