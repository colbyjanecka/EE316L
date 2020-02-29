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
ExecStep $xv_path/bin/xsim tb_bcd_behav -key {Behavioral:sim_1:Functional:tb_bcd} -tclbatch tb_bcd.tcl -log simulate.log
