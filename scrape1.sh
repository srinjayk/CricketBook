wget http://www.espncricinfo.com/ci/content/player/index.html
#links=`cat index.html  | sed -n '/<!-- odi player div starts -->/,/<!-- odi player div ends -->/p' | grep -o 'href="[^>]"' | sed -E 's/href="\/ci(.)"/http:\/\/www.espncricinfo.com\/india\1/g'`
#cat index.html  | sed -n '/<!-- odi player div starts -->/,/<!-- odi player div ends -->/p' | grep -o 'href="[^>]"' | sed -E 's/href="\/ci(.)"/http:\/\/www.espncricinfo.com\/india\1/g' > middle
cat index.html  | sed -n '/<!-- odi player div starts -->/,/<!-- odi player div ends -->/p' | sed -E 's/href="\/ci(.)"/http:\/\/www.espncricinfo.com\/india\1/g' | grep href  > middle
# rm index.html
# while 
#cat middle | sed -n '/<!-- odi player div starts -->/,/<!-- odi player div ends -->/p' | sed -E 's/<*>/g' > middle1
echo $links 
cat middle | sed -E 's/<td class="divider"><a href="//g' > middle1
cat mid | sed -E 's/<td class=""><a href="//g' > mid2
cat mid2 | sed -E 's/<td class=""><a href="//g' > mid2

mkdir player_data
for link in `cat middle`
do
	#echo $link
	wget ${link}
done
rm index.html

#http://espncricinfo.com/ci/content/player/376116.html