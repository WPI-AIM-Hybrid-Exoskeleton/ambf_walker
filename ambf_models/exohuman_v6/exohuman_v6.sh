source ~/.bashrc
#source ~/ambf/build/devel/setup.bash
cd ~/ambf/bin/lin-x86_64
./ambf_simulator -a ${AMBF_WALKER}/ambf_models/exohuman_v6/exohuman_v6.yaml  -t 1 -p 1000
