a) grupy są rozpatrywane w kolejnosci alfabetycznej i kolejne grupy nadpisuja zmienne
b) koeljne inwentarze nadpisuja zmienne

c) command odapla pojedyncza komende, a shell odpala shellowe rzecz

ansible hosts -i ./inventory.ini -m shell -a 'head -n 100 /dev/random | tr -d -c a-z | grep -c ab'



d)
automatycznie ansible zbiera fakty przy uruchamianiu tasków
