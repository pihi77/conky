pozicia_x=$2
pozicia_y=$3
min_sirka=$4
min_vyska=$5

filename=./auto_generated/auto_$1
auto_config=./auto_generated/auto_config.sh

cp ./components/default.conf $filename
cat ./components/$1 >> "$filename"

search="pozicia_x";
sed -i "s/$search/$pozicia_x/" $filename

search="pozicia_y";
sed -i "s/$search/$pozicia_y/" $filename

search="min_sirka";
sed -i "s/$search/$min_sirka/" $filename

search="min_vyska";
sed -i "s/$search/$min_vyska/" $filename

if [[ $6 = "last" ]];
then
    echo "conky -q -c $filename" >> $auto_config
else
    echo "conky -q -c $filename |" >> $auto_config
fi