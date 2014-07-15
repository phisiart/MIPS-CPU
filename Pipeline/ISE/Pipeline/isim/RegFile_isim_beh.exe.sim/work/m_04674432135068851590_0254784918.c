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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/sean/Dropbox/CPU/CPU/Pipeline/Pipeline_Regfile.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {1, 0};
static int ng3[] = {32, 0};
static int ng4[] = {29, 0};
static unsigned int ng5[] = {1073741820U, 0U};



static void Cont_13_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t41[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;

LAB0:    t1 = (t0 + 3936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(13, ng0);
    t2 = (t0 + 1664U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t41, 8);

LAB20:    t48 = (t0 + 4864);
    t50 = (t48 + 56U);
    t51 = *((char **)t50);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    memcpy(t53, t3, 8);
    xsi_driver_vfirst_trans(t48, 0, 31);
    t54 = (t0 + 4752);
    *((int *)t54) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t38 = (t0 + 2864);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t42 = (t0 + 2864);
    t43 = (t42 + 72U);
    t44 = *((char **)t43);
    t45 = (t0 + 2864);
    t46 = (t45 + 64U);
    t47 = *((char **)t46);
    t48 = (t0 + 1664U);
    t49 = *((char **)t48);
    xsi_vlog_generic_get_array_select_value(t41, 32, t40, t44, t47, 2, 1, t49, 5, 2);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t33, 32, t41, 32);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

}

static void Cont_14_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t41[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;

LAB0:    t1 = (t0 + 4184U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(14, ng0);
    t2 = (t0 + 1824U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t41, 8);

LAB20:    t48 = (t0 + 4928);
    t50 = (t48 + 56U);
    t51 = *((char **)t50);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    memcpy(t53, t3, 8);
    xsi_driver_vfirst_trans(t48, 0, 31);
    t54 = (t0 + 4768);
    *((int *)t54) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t38 = (t0 + 2864);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t42 = (t0 + 2864);
    t43 = (t42 + 72U);
    t44 = *((char **)t43);
    t45 = (t0 + 2864);
    t46 = (t45 + 64U);
    t47 = *((char **)t46);
    t48 = (t0 + 1824U);
    t49 = *((char **)t48);
    xsi_vlog_generic_get_array_select_value(t41, 32, t40, t44, t47, 2, 1, t49, 5, 2);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t33, 32, t41, 32);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

}

static void Always_18_2(char *t0)
{
    char t4[8];
    char t31[8];
    char t34[8];
    char t35[8];
    char t76[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t32;
    char *t33;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    int t46;
    char *t47;
    int t48;
    int t49;
    int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    int t82;
    int t83;

LAB0:    t1 = (t0 + 4432U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 4784);
    *((int *)t2) = 1;
    t3 = (t0 + 4464);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(18, ng0);

LAB5:    xsi_set_current_line(19, ng0);
    t5 = (t0 + 1184U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t16 = (~(t15));
    *((unsigned int *)t4) = t16;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB11;

LAB10:    t21 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t21 & 1U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    t23 = (t4 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(29, ng0);

LAB29:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 1504U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t2) != 0)
        goto LAB32;

LAB33:    t6 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t6);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB34;

LAB35:    memcpy(t34, t4, 8);

LAB36:    t36 = (t34 + 4);
    t71 = *((unsigned int *)t36);
    t72 = (~(t71));
    t73 = *((unsigned int *)t34);
    t74 = (t73 & t72);
    t75 = (t74 != 0);
    if (t75 > 0)
        goto LAB44;

LAB45:
LAB46:
LAB14:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB11:    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t4) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB10;

LAB12:    xsi_set_current_line(19, ng0);

LAB15:    xsi_set_current_line(20, ng0);
    xsi_set_current_line(20, ng0);
    t29 = ((char*)((ng2)));
    t30 = (t0 + 3024);
    xsi_vlogvar_assign_value(t30, t29, 0, 0, 32);

LAB16:    t2 = (t0 + 3024);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t4, 0, 8);
    xsi_vlog_signed_less(t4, 32, t5, 32, t6, 32);
    t12 = (t4 + 4);
    t7 = *((unsigned int *)t12);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB17;

LAB18:    goto LAB14;

LAB17:    xsi_set_current_line(20, ng0);

LAB19:    xsi_set_current_line(21, ng0);
    t13 = (t0 + 3024);
    t14 = (t13 + 56U);
    t23 = *((char **)t14);
    t29 = ((char*)((ng4)));
    memset(t31, 0, 8);
    xsi_vlog_signed_equal(t31, 32, t23, 32, t29, 32);
    t30 = (t31 + 4);
    t15 = *((unsigned int *)t30);
    t16 = (~(t15));
    t17 = *((unsigned int *)t31);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB20;

LAB21:    xsi_set_current_line(24, ng0);

LAB26:    xsi_set_current_line(25, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2864);
    t5 = (t0 + 2864);
    t6 = (t5 + 72U);
    t12 = *((char **)t6);
    t13 = (t0 + 2864);
    t14 = (t13 + 64U);
    t23 = *((char **)t14);
    t29 = (t0 + 3024);
    t30 = (t29 + 56U);
    t32 = *((char **)t30);
    xsi_vlog_generic_convert_array_indices(t4, t31, t12, t23, 2, 1, t32, 32, 1);
    t33 = (t4 + 4);
    t7 = *((unsigned int *)t33);
    t46 = (!(t7));
    t36 = (t31 + 4);
    t8 = *((unsigned int *)t36);
    t48 = (!(t8));
    t49 = (t46 && t48);
    if (t49 == 1)
        goto LAB27;

LAB28:
LAB22:    xsi_set_current_line(20, ng0);
    t2 = (t0 + 3024);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_signed_add(t4, 32, t5, 32, t6, 32);
    t12 = (t0 + 3024);
    xsi_vlogvar_assign_value(t12, t4, 0, 0, 32);
    goto LAB16;

LAB20:    xsi_set_current_line(21, ng0);

LAB23:    xsi_set_current_line(22, ng0);
    t32 = ((char*)((ng5)));
    t33 = (t0 + 2864);
    t36 = (t0 + 2864);
    t37 = (t36 + 72U);
    t38 = *((char **)t37);
    t39 = (t0 + 2864);
    t40 = (t39 + 64U);
    t41 = *((char **)t40);
    t42 = (t0 + 3024);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    xsi_vlog_generic_convert_array_indices(t34, t35, t38, t41, 2, 1, t44, 32, 1);
    t45 = (t34 + 4);
    t20 = *((unsigned int *)t45);
    t46 = (!(t20));
    t47 = (t35 + 4);
    t21 = *((unsigned int *)t47);
    t48 = (!(t21));
    t49 = (t46 && t48);
    if (t49 == 1)
        goto LAB24;

LAB25:    goto LAB22;

LAB24:    t22 = *((unsigned int *)t34);
    t24 = *((unsigned int *)t35);
    t50 = (t22 - t24);
    t51 = (t50 + 1);
    xsi_vlogvar_wait_assign_value(t33, t32, 0, *((unsigned int *)t35), t51, 0LL);
    goto LAB25;

LAB27:    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t31);
    t50 = (t9 - t10);
    t51 = (t50 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t31), t51, 0LL);
    goto LAB28;

LAB30:    *((unsigned int *)t4) = 1;
    goto LAB33;

LAB32:    t5 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t5) = 1;
    goto LAB33;

LAB34:    t12 = (t0 + 1984U);
    t13 = *((char **)t12);
    memset(t31, 0, 8);
    t12 = (t13 + 4);
    t18 = *((unsigned int *)t12);
    t19 = (~(t18));
    t20 = *((unsigned int *)t13);
    t21 = (t20 & t19);
    t22 = (t21 & 31U);
    if (t22 != 0)
        goto LAB37;

LAB38:    if (*((unsigned int *)t12) != 0)
        goto LAB39;

LAB40:    t24 = *((unsigned int *)t4);
    t25 = *((unsigned int *)t31);
    t26 = (t24 & t25);
    *((unsigned int *)t34) = t26;
    t23 = (t4 + 4);
    t29 = (t31 + 4);
    t30 = (t34 + 4);
    t27 = *((unsigned int *)t23);
    t28 = *((unsigned int *)t29);
    t52 = (t27 | t28);
    *((unsigned int *)t30) = t52;
    t53 = *((unsigned int *)t30);
    t54 = (t53 != 0);
    if (t54 == 1)
        goto LAB41;

LAB42:
LAB43:    goto LAB36;

LAB37:    *((unsigned int *)t31) = 1;
    goto LAB40;

LAB39:    t14 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB40;

LAB41:    t55 = *((unsigned int *)t34);
    t56 = *((unsigned int *)t30);
    *((unsigned int *)t34) = (t55 | t56);
    t32 = (t4 + 4);
    t33 = (t31 + 4);
    t57 = *((unsigned int *)t4);
    t58 = (~(t57));
    t59 = *((unsigned int *)t32);
    t60 = (~(t59));
    t61 = *((unsigned int *)t31);
    t62 = (~(t61));
    t63 = *((unsigned int *)t33);
    t64 = (~(t63));
    t46 = (t58 & t60);
    t48 = (t62 & t64);
    t65 = (~(t46));
    t66 = (~(t48));
    t67 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t67 & t65);
    t68 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t68 & t66);
    t69 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t69 & t65);
    t70 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t70 & t66);
    goto LAB43;

LAB44:    xsi_set_current_line(30, ng0);
    t37 = (t0 + 2464U);
    t38 = *((char **)t37);
    t37 = (t0 + 2864);
    t39 = (t0 + 2864);
    t40 = (t39 + 72U);
    t41 = *((char **)t40);
    t42 = (t0 + 2864);
    t43 = (t42 + 64U);
    t44 = *((char **)t43);
    t45 = (t0 + 1984U);
    t47 = *((char **)t45);
    xsi_vlog_generic_convert_array_indices(t35, t76, t41, t44, 2, 1, t47, 5, 2);
    t45 = (t35 + 4);
    t77 = *((unsigned int *)t45);
    t49 = (!(t77));
    t78 = (t76 + 4);
    t79 = *((unsigned int *)t78);
    t50 = (!(t79));
    t51 = (t49 && t50);
    if (t51 == 1)
        goto LAB47;

LAB48:    goto LAB46;

LAB47:    t80 = *((unsigned int *)t35);
    t81 = *((unsigned int *)t76);
    t82 = (t80 - t81);
    t83 = (t82 + 1);
    xsi_vlogvar_wait_assign_value(t37, t38, 0, *((unsigned int *)t76), t83, 0LL);
    goto LAB48;

}


extern void work_m_04674432135068851590_0254784918_init()
{
	static char *pe[] = {(void *)Cont_13_0,(void *)Cont_14_1,(void *)Always_18_2};
	xsi_register_didat("work_m_04674432135068851590_0254784918", "isim/RegFile_isim_beh.exe.sim/work/m_04674432135068851590_0254784918.didat");
	xsi_register_executes(pe);
}
