wget http://downloads.tatoeba.org/exports/sentences.tar.bz2
wget http://downloads.tatoeba.org/exports/links.tar.bz2
echo "Extract sentences.csv..."
tar xvjf sentences.tar.bz2
echo "Ready!"
echo "Extract links.csv..."
tar xvjf links.tar.bz2
echo "Ready!"
echo "sentences.csv pocessing"
sed 's/"/""/g;s/[^\t]*/"&"/g' sentences.csv > sentences_sed.csv
echo "Ready!"
echo "Creating database"
sqlite3 < initLite.sql
echo "Ready!"
echo "Cleaning..."
rm -rf sentences.tar.bz2 links.tar.bz2 sentences.csv links.csv sentences_sed.csv
echo "Ready!"
echo "Installation completed successfully"