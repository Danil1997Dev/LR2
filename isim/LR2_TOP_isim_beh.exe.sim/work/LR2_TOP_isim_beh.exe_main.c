/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001034131228_1820768435_init();
    work_m_00000000000394672378_2031314432_init();
    work_m_00000000002209629687_2680785516_init();
    work_m_00000000002253203219_1000121515_init();
    work_m_00000000003212910361_0955971647_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003212910361_0955971647");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
