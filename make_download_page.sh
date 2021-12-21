#!/usr/bin/env bash
[ ! -d dist ] && mkdir dist
echo -e "<html>\n<head><title>Sops download page></title>\n<body>\n<h1>Sops download page</h1>\n<h2><a href="https://github.com/tozd/sops/">github.com/tozd/sops</a></h2>\n<table>" > index.html
IFS=$'\n'
for dist in $(aws s3 ls s3://github.com/tozd/sops/dist/ | grep -P "deb|rpm"); do
	ts=$(echo $dist|awk '{print $1,$2}')
	size=$(echo $dist|awk '{print $3}')
	pkg=$(echo $dist|awk '{print $4}')
	echo -e "<tr><td>$ts</td><td>$size</td><td><a href=\"https://github.com/tozd/sops/dist/$pkg\">$pkg</a></td></tr>" >> index.html
done
echo -e "</table>\n</body>\n</html>" >> index.html
