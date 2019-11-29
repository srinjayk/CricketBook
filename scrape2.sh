wget http://www.espncricinfo.com/ci/content/player/index.html
links=`cat index.html  | sed -n '/<!-- odi player div starts -->/,/<!-- odi player div ends -->/p' | grep -o 'href="[^>]"' | sed -E 's/href="\/ci(.)"/http:\/\/www.espncricinfo.com\/india\1/g'`
# rm index.html
# while 
mkdir player_data
for link in $links
do
	wget -P player_data/ ${link}
done
rm index.html