grep -v -f chickenZ.hits 2022/bid_gid_scf.orign > chickenZ.nonhits
grep -v -f zebrafinchZ.hits 2022/bid_gid_scf.orign > zebrafinchZ.nonhits
cat chickenZ.hits zebrafinchZ.hits|sort|uniq -c|awk '{if($1==2) print $2}' > blastZ.nonhits
grep -f 2022/list1125.repeatlist 2022/bid_gid_scf.orign  > TEfilter.nonhits
cat blastZ.nonhits TEfilter.nonhits|sort|uniq > nonhits.list
cat nonhits.list |cut -d, -f1|sort|uniq > dele.bid.list
cat 2022.merge.filter.unified.csv |while read i; do bid=`echo $i|cut -d, -f1`; gid=`echo $i|cut -d, -f4`; scf=`grep -w "$gid" bid_gid_scf.orign|cut -d, -f3`; echo "$i,$scf" >> 2022.merge.filter.unified.scf.csv; done
