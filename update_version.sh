OLD_VERSION=0\.5\.6
NEW_VERSION=0\.6\.0

for file in $(grep -lr $OLD_VERSION --exclude-dir docs --exclude-dir .git .); do
    sed -i "s/$OLD_VERSION/$NEW_VERSION/" $file
done
