git clone https://github.com/lupoDharkael/flameshot
cd flameshot

apt install git g++ build-essential qt5-qmake qt5-default qttools5-dev-tools
qmake && make
sudo make install

cd ..
rm -rf flameshot