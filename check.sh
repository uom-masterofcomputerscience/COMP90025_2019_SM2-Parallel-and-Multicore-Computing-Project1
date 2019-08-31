gcc headers/randomgraph.c -o randomgraph

gcc -fopenmp onePunch.c  -o onePunch

problemSize=$1
maxWeight=233
echo "[*] problem size: $problemSize"
#./randomgraph $problemSize 0.3 $maxWeight 1
echo ""
echo "======== ours && parallel ======="
gcc -fopenmp graph-diameter.c -o graph-diameter
./randomgraph $problemSize 0.3 $maxWeight 1|./graph-diameter

echo ""
echo "======== origin && parallel ======="
gcc -fopenmp  graph-diameter-origin-parallel.c -o graph-diameter-origin-parallel
./randomgraph $problemSize 0.3 $maxWeight 1 |./graph-diameter-origin-parallel

echo ""
echo "========       origin       ======="
gcc graph-diameter-origin.c -o graph-diameter-origin
./randomgraph $problemSize 0.3 $maxWeight 1 |./graph-diameter-origin
