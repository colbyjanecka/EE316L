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
ExecStep $xv_path/bin/xelab -wto cebc0db4b8024da99b9b77a30082266e -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_datapath_behav xil_defaultlib.tb_datapath xil_defaultlib.glbl -log elaborate.log
