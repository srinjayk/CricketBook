sudo bash scrape3.bash
sudo bash scrape4.bash player_data > data
cat data | grep Australia >> players.csv