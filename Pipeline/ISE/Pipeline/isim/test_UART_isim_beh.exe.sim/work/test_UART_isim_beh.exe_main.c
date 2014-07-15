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
    work_m_04030189276222991812_1566567513_init();
    work_m_05544940573068007459_2821169855_init();
    work_m_07896498897316063519_0645510365_init();
    work_m_13047909506504810838_1684398682_init();
    work_m_15152117416958726816_3935009140_init();
    work_m_12295450726786695028_3865191691_init();
    work_m_18405286978293578093_0127395194_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_18405286978293578093_0127395194");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
