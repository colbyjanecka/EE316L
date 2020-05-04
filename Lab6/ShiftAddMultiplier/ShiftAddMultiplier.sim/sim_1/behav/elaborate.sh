#!/bin/bash -f
xv_path="/usr/local/packages/xilinx_2016/Vivado/2016.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 2f0333e23de846238c21ac6d90253fba -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_mult_behav xil_defaultlib.tb_mult xil_defaultlib.glbl -log elaborate.log
