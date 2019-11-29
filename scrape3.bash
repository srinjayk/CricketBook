#wget http://www.espncricinfo.com/ci/content/player/index.html
wget http://www.espncricinfo.com/ci/content/player/index.html?country=2 
#links=`cat index.html  | sed -n '/<!-- odi player div starts -->/,/<!-- odi player div ends -->/p' | grep -o 'href="[^>]*"' | sed -E 's/href="\/ci(.*)"/http:\/\/www.espncricinfo.com\/india\1/g'`
# rm index.html
# while 
echo $links
cat index.html\?country\=2 | sed -n '/<!-- odi player div starts -->/,/<!-- odi player div ends -->/p' > middle1
cat middle1 | grep -o 'href="[^>]*"' > middle2
cat middle2 | sed -E 's/href="\/ci(.*)"/http:\/\/www.espncricinfo.com\/india\1/g' > middle3
rmdir player_data
mkdir player_data
#for link in $links
#do
#	wget -P player_data/ ${link}
#done

for link in `cat middle3`
do
	wget -P player_data/ ${link}
done

rm index.html
rm middle3
rm middle1
rm middle2
