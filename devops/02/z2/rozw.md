

# build 
docker build --tag z2 .

# run 
run docker run -D -p 222:22 z2
ssh -p 222 root@localhost

# run it
run docker run -it -p 222:22 z2 bash
