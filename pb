apt update
apt install -y zstd
cd
mkdir -v a
cd a
wget http://raw.githubusercontent.com/CE1CECL/n/main/repo
cp -vrf ./repo /usr/bin/repo
chmod 7777 -vR /usr/bin/repo
export HTAP=$PWD/Download/
mkdir -vp $HTAP
cd $HTAP
rm -vrf ./*
rm -vrf ./.*
echo "maybe so" > yes.no
mkdir -vp pb
cd pb
repo init -u http://github.com/CE1CECL/n -c --no-tags --dissociate --partial-clone --no-use-superproject --no-clone-bundle --no-git-lfs --no-repo-verify -m pb.xml
repo sync -j$(nproc --all) --fail-fast --nmu -d -c --no-clone-bundle --no-use-superproject --no-tags --prune --no-repo-verify
rm -vrf ./.repo
cd $HTAP
rm -vrf $HTAP/yes.no
tar -I 'zstd --ultra -22 -v -T0 -r --format=zstd' -c -v -f '/home/runner/pb.tar.zst' './'
chmod 7777 -vR /home/runner/pb.tar.zst
