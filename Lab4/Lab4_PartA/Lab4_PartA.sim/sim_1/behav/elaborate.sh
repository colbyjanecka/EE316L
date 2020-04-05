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
ExecStep $xv_path/bin/xelab -wto 085fbd0e6b2d4159bfaf0b73ee982d1d -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_clks_behav xil_defaultlib.tb_clks xil_defaultlib.glbl -log elaborate.log
