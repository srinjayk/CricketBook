for file in `ls ${1}`
do
	name=$(grep 'og:title' "${1}/${file}" | sed -E 's/.*content=\"([^\"]*)\".*/\1/g')
	bat_avg=$(grep -A 6 -m 1 'ODIs' "${1}/${file}" | tail -n 1 | sed -E 's/[^>]*>([0-9.-]*)<.*/\1/g')
	team=$(echo "Australia")
	echo -e "$name $bat_avg $team"
	sudo bash scrape4.bash "$name" "$team" "$bat_avg"
done