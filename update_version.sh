OLD_VERSION=0\.5\.0
NEW_VERSION=0\.5\.1

for file in $(grep -lr $OLD_VERSION --exclude-dir docs .); do
    sed -i "s/$OLD_VERSION/$NEW_VERSION/" $file
done
