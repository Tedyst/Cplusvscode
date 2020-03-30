cmp --silent $1/main.cpp /tmp/testbuild
if [ ! $? -ne 0 ]; then 
    echo "deja compilat"
    exit 0
fi
echo "Starting building..."
rm -f $1/main.exe || true
cmp --silent $1/main.cpp /tmp/testbuild
if [ ! -f $1/main.cpp ]; then
    echo "main.cpp not found!"
    exit 1
fi
if [ ! -f $1/main.exe ]; then
    g++ -g $1/main.cpp -o $1/main.exe
    cp $1/main.cpp /tmp/testbuild
fi
g++ -g $1/main.cpp -o $1/main.exe
cp $1/main.cpp /tmp/testbuild
